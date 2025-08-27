import { PrismaClient } from '@prisma/client';
import * as bcrypt from 'bcrypt';
// def d'un utilisateur administrateur
const prisma = new PrismaClient();

async function main() {
  const exists = await prisma.user.findUnique({
    where: { email: 'admin@vandshop.com' },
  });
  if (!exists) {
    await prisma.user.create({
      data: {
        email: 'admin@vandshop.com',
        password: await bcrypt.hash('admin123', 10),
        role: 'ADMIN',
        name: 'Admin User',
        address: '123 Admin Street',
      },
    });
  }
}

main().finally(() => prisma.$disconnect());
