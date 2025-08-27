import { 
  Controller, Get, Post, Body, Patch, Param, Delete, 
  UseInterceptors, UploadedFiles 
} from '@nestjs/common';
import { ProductService } from './product.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { FileFieldsInterceptor } from '@nestjs/platform-express';
import { FileTypeValidationPipe } from './utils/file-validator';

@Controller('product')
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @Post()
  @UseInterceptors(FileFieldsInterceptor([{ name: 'images', maxCount: 3 }]))
  create(
    @Body() createProductDto: CreateProductDto,
    @UploadedFiles(new FileTypeValidationPipe())
    files: { images: Express.Multer.File[] }, 
   ) {
    return this.productService.create(createProductDto, files.images || []);
  }

  @Get('')
  findAll() {
    return this.productService.findAll();
  }

  @Get()
  findOne(@Param('id') id: string) {
    return this.productService.findOne(+id);
  }

  @Patch()
  update(@Param('id') id: string, @Body() updateProductDto: UpdateProductDto) {
    return this.productService.update(+id, updateProductDto);
  }

  @Delete()
  remove(@Param('id') id: string) {
    return this.productService.remove(+id);
  }
}
