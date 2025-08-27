import { Injectable, UnauthorizedException } from '@nestjs/common';
import { CreateAuthDto } from './dto/create-auth.dto';
import { UpdateAuthDto } from './dto/update-auth.dto';
import { UserService } from '../user/user.service';
import { User } from '@prisma/client';
import { CreateUserDto } from '../user/dto/create-user.dto';
import { LoginDTO } from '../user/dto/login_dto';
import * as bcrypt from "bcryptjs";
import { JwtService } from '@nestjs/jwt';
import { ActiveUserData } from './interfaces/active-user-data';


@Injectable()
export class AuthService {
  
  constructor(
    private userService: UserService, 
    private jwtService: JwtService){}

  create(createUserDto: CreateUserDto): Promise<User> {
    return this.userService.create(createUserDto);
  }

  async login(loginDto: LoginDTO) {
    const user = await this.userService.findByEmail(loginDto);
    const passwordMatched = await bcrypt.compare(loginDto.password, user.password)

    if(passwordMatched){
      delete (user as any).password;
      const payload ={
        userId: user.id,
        email: user.email,
      } as ActiveUserData;
      return {
        user:user,
        accessToken: this.jwtService.sign(payload)
      }

    }else {
      throw new UnauthorizedException("password does not match")
    }

    return `This action returns all auth`;
  }

  findOne(id: number) {
    return `This action returns a #${id} auth`;
  }

  update(id: number, updateAuthDto: UpdateAuthDto) {
    return `This action updates a #${id} auth`;
  }

  remove(id: number) {
    return `This action removes a #${id} auth`;
  }
}
