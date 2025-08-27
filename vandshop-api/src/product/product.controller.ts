import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseInterceptors,
  UploadedFiles,
  UseGuards,
  Query,
} from '@nestjs/common';
import { ProductService } from './product.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { FileFieldsInterceptor } from '@nestjs/platform-express';
import { FileTypeValidationPipe } from './utils/file-validator';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { JwtAuthGuard } from 'src/auth/jwt.guard';

@ApiTags('products')
@Controller('products')
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @Post()
  @ApiBearerAuth()
  @UseGuards(JwtAuthGuard)
  @UseInterceptors(FileFieldsInterceptor([{ name: 'images', maxCount: 3 }]))
  create(
    @Body() createProductDto: CreateProductDto,
    @UploadedFiles(new FileTypeValidationPipe())
    files: { images: Express.Multer.File[] },
  ) {
    return this.productService.create(createProductDto, files.images || []);
  }

  @Get()
  list(@Query('q') q?: string) {
    return this.productService.findAll(q);
  }

  // @Get('')
  // findAll() {
  //   return this.productService.findAll();
  // }

  // @Get()
  // findOne(@Param('id') id: string) {
  //   return this.productService.findOne(+id);
  // }

  @Patch()
  update(@Param('id') id: string, @Body() updateProductDto: UpdateProductDto) {
    return this.productService.update(id, updateProductDto);
  }

  @ApiBearerAuth()
  @UseGuards(JwtAuthGuard)
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.productService.remove(id);
  }
}
