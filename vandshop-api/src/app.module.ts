import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './user/user.module';
import { PrismaModule } from './prisma/prisma.module';
import { AuthModule } from './auth/auth.module';
import { CategoryModule } from './category/category.module';
import { ProductModule } from './product/product.module';
import { ConfigModule } from '@nestjs/config';
import { MediaModule } from './media/media.module';
import { SalesModule } from './sales/sales.module';
import app_config from './config/app_config';

@Module({
  imports: [UserModule,
     PrismaModule,
     AuthModule, 
     CategoryModule,
     ProductModule,
     ConfigModule.forRoot({ load:[app_config], isGlobal: true }),
     MediaModule,
     SalesModule], 
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
