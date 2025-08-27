import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
// import { v2 as cloudinary } from 'cloudinary'
import {
  v2 as cloudinary,
  UploadApiResponse,
  UploadApiErrorResponse,
} from 'cloudinary';

@Injectable()
export class MediaService {
  constructor(private readonly configService: ConfigService) {
    cloudinary.config({
      cloud_name: configService.get<string>('appConfig.cloudinaryName'),
      api_key: configService.get<string>('appConfig.cloudinaryApiKey'),
      api_secret: configService.get<string>('appConfig.cloudinarySecretKey'),
    });
  }

  async uploadImages(file: Express.Multer.File): Promise<string> {
    return new Promise((resolve, reject) => {
      const uploadStream = cloudinary.uploader.upload_stream(
        { folder: 'products', resource_type: 'image' },
        (
          error: UploadApiErrorResponse | undefined,
          result: UploadApiResponse | undefined,
        ) => {
          if (error) return reject(error);
          if (!result)
            return reject(new Error('Upload failed, no result returned.'));
          resolve(result.secure_url);
        },
      );

      uploadStream.end(file.buffer);
    });
  }
}
