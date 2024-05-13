import Image from "next/image";
import {db} from "@/prisma/db";

export default async function Home() {
  const users = await db.user.findMany();
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      {users.map(user => <div key={user.id}>{user.username}</div>)}
      <p className="text-white text-3xl">{users.length}</p>
    </main>
  );
}
