import { IsString, IsInt, IsOptional, IsNumber, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateProductDto {
  @IsString()
  name: string;

  @IsString()
  description: string;

  @IsNumber()
  @Type(() => Number)
  @Min(0)
  price: number;

  @IsOptional()
  @IsString()
  barcode?: string;

  @IsOptional()
  @IsString()
  sku?: string;

  @IsInt()
  @Type(() => Number) // converts incoming string to number
  categoryId: number;

  @IsOptional()
  @IsInt()
  @Type(() => Number)
  @Min(0)
  stock?: number;
}
