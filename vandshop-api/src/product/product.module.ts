import { Module } from '@nestjs/common';
import { ProductService } from './product.service';
import { ProductController } from './product.controller';
import { MediaModule } from '../media/media.module';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
  imports: [ MediaModule, PrismaModule],
  controllers: [ProductController],
  providers: [ProductService],
})
export class ProductModule {}
