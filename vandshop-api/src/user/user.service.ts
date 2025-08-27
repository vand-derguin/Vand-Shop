import { LoginDTO } from './dto/login_dto';
import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from '../prisma/prisma.service';
import * as bcrypt from "bcryptjs";
import { User } from '@prisma/client';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService){}

  async create(createUserDto: CreateUserDto): Promise<User> {
      const salt : string = await bcrypt.genSalt()
      createUserDto.password = await bcrypt.hash(createUserDto.password, salt);

      const newuser = await this.prisma.user.create({data:createUserDto});
      if(!newuser){
        throw new HttpException(`something went wrong during creating ${createUserDto.name}`, HttpStatus.NOT_FOUND);
      }
      delete (createUserDto as any).password;
      // delete createUserDto.password;
    return newuser;
  }

  async findByEmail(loginDTO: LoginDTO) :Promise<User> {
    const user = await this.prisma.user.findFirst({
      where: { email: loginDTO.email},
    });

    if(!user){
      throw new HttpException("User Not Found", HttpStatus.NOT_FOUND); 
    }
    return user;
  }

  findOne(id: number) {
    return `This action returns a #${id} user`;
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
