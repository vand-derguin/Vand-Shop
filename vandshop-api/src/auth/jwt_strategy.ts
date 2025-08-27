import { Injectable } from '@nestjs/common';
import { ExtractJwt, Strategy } from "passport-jwt";
import { PassportStrategy } from "@nestjs/passport";
import { authConstants } from "./auth_constant";
import { ActiveUserData } from './interfaces/active-user-data';


@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy){

    constructor(){
        super({
            jwtFrontRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
            ignoreExpiration: false,
            secretOrKey : authConstants.secret,
        } as any);
    }

    async validate(payload: ActiveUserData){
        return {
            userId: payload.userId,
            email: payload.email,
        }
    }
}



// const { ExtractJwt, Strategy } = require('passport-jwt');

// const opts = {
//     jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
//     secretOrKey: 'your_jwt_secret'
// };

// passport.use(new Strategy(opts, (jwt_payload, done) => {
//     // Your user retrieval logic here
// }));