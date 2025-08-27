import { Body, Controller, Post, UseGuards } from '@nestjs/common';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuard } from '../auth/jwt.guard';
import { SalesService } from './sales.service';
import { CheckoutDto } from './dto/checkout.dto';

@ApiTags('sales')
@ApiBearerAuth()
@UseGuards(JwtAuthGuard)
@Controller('sales')
export class SalesController {
  constructor(private readonly svc: SalesService) {}
  @Post('checkout') checkout(@Body() dto: CheckoutDto) {
    return this.svc.checkout(dto);
  }
}
