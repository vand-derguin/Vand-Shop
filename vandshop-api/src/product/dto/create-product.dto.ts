import { ApiProperty } from '@nestjs/swagger';
import { IsNumber, IsOptional, IsString } from 'class-validator';

export class CreateProductDto {
  @ApiProperty() @IsString() name: string;
  @ApiProperty() @IsString() description: string;
  @ApiProperty({ required: false }) @IsOptional() @IsString() barcode?: string;
  @ApiProperty({ required: false }) @IsOptional() @IsString() sku?: string;
  @ApiProperty() @IsNumber() price: number;
  @ApiProperty() @IsNumber() category: number;
  @ApiProperty() @IsNumber() stock: number;
}
