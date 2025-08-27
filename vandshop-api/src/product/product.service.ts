import { MediaService } from './../media/media.service';
import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { PrismaService } from '../prisma/prisma.service';
import { Product } from '@prisma/client';

@Injectable()
export class ProductService {
  constructor(
    private readonly mediaService: MediaService,
    private readonly prisma: PrismaService,
  ) {}
  async create(
    createProductDto: CreateProductDto,
    files: Express.Multer.File[],
  ) {
    const uploadedImages = await Promise.all(
      files.map((file) => this.mediaService.uploadImages(file)),
    );

    const product = await this.prisma.product.create({
      data: {
        name: createProductDto.name,
        price: createProductDto.price,
        description: createProductDto.description,
        barcode: createProductDto.barcode,
        stock: createProductDto.stock,
        sku: createProductDto.sku,
        category: { connect: { id: createProductDto.category } }, // Connect category by ID
        ProductImage: {
          create: uploadedImages.map((url) => ({
            url,
          })),
        },
      },
      include: {
        ProductImage: { select: { url: true } },
      },
    });

    return product;
  }

  async findAll(q?: string): Promise<Product[]> {
    const products = await this.prisma.product.findMany({
      where: q
        ? {
            OR: [{ name: { contains: q } }, { barcode: { contains: q } }],
          }
        : undefined,
      orderBy: { createdAt: 'desc' },
      include: { ProductImage: { select: { url: true } } },
    });

    if (!products) {
      throw new HttpException('no avalable product', HttpStatus.NOT_FOUND);
    }

    return products;
  }

  // findOne(id: number) {
  //   return `This action returns a #${id} product`;
  // }

  update(id: string, data: Partial<CreateProductDto>) {
    const { category, ...rest } = data;
    const updateData: any = { ...rest };
    if (category !== undefined) {
      updateData.category = { connect: { id: category } };
    }
    return this.prisma.product.update({ where: { id }, data: updateData });
  }

  remove(id: string) {
    return this.prisma.product.delete({ where: { id } });
  }
}
