import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CheckoutDto } from './dto/checkout.dto';
import { Decimal } from '@prisma/client/runtime/library';

@Injectable()
export class SalesService {
  constructor(private prisma: PrismaService) {}

  async checkout(dto: CheckoutDto) {
    return this.prisma.$transaction(async (tx) => {
      const products = await tx.product.findMany({
        where: { id: { in: dto.items.map((i) => i.productId) } },
      });

      const items = dto.items.map((i) => {
        const p = products.find((p) => p.id === i.productId)!;
        const unit = new Decimal(p.price);
        const qty = new Decimal(i.quantity);
        const lineTotal = unit.mul(qty);
        return {
          productId: p.id,
          quantity: i.quantity,
          unitPrice: unit,
          lineTotal,
        };
      });

      const total = items.reduce(
        (acc, it) => acc.add(it.lineTotal),
        new Decimal(0),
      );

      const sale = await tx.sale.create({ data: { total } });
      await Promise.all(
        items.map((it) =>
          tx.saleItem.create({ data: { ...it, saleId: sale.id } }),
        ),
      );

      // optional: decrement stock
      await Promise.all(
        dto.items.map((i) =>
          tx.product.update({
            where: { id: i.productId },
            data: { stock: { decrement: i.quantity } },
          }),
        ),
      );

      return tx.sale.findUnique({
        where: { id: sale.id },
        include: { items: true },
      });
    });
  }
}
