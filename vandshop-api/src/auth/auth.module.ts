import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { UserModule } from '../user/user.module';
import { JwtModule } from '@nestjs/jwt';
import { authConstants } from './auth_constant';
import { JwtStrategy } from './jwt_strategy';


@Module({
  imports: [UserModule,
    JwtModule.register({
      secret: authConstants.secret,
      signOptions:{
        expiresIn: '1d'
      }
    })
  ],
  
  controllers: [AuthController],
  providers: [AuthService, ],
})
export class AuthModule {}
