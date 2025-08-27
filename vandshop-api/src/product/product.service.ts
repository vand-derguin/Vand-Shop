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
  ){}
  async create(
    createProductDto: CreateProductDto,
    files: Express.Multer.File[],
  ) {
    const uploadedImages = await Promise.all(
      files.map((file) => this.mediaService.uploadImages(file)),
    )

    const product  = await this.prisma.product.create({
      data: {
        name: createProductDto.name,
        price: createProductDto.price,
        description: createProductDto.description,
        barecode: createProductDto.barecode,
        stock: createProductDto.stock,
        categoryId : parseInt(String(createProductDto.categoryId)),
        ProductImage: {
          create: uploadedImages.map((url) => ({
            url,
          })),
        },
      },
      include: {
        ProductImage: {select: {url:true}}
      },
    });

    return product;
  }

 async findAll(): Promise<Product[]> {

  const products = await this.prisma.product.findMany({include: {ProductImage:{select:{url:true}}}})

  if (!products){
    throw new HttpException("no avalable product", HttpStatus.NOT_FOUND)
  }

  return products;
  }

  findOne(id: number) {
    return `This action returns a #${id} product`;
  }

  update(id: number, updateProductDto: UpdateProductDto) {
    return `This action updates a #${id} product`;
  }

  remove(id: number) {
    return `This action removes a #${id} product`;
  }
}
