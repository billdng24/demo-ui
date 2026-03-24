"use client";
import { useEffect, useState } from "react";

export default function Home() {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetch("http://localhost:8000")
      .then(res => res.json())
      .then(setData);
  }, []);

  return (
    <div>
      <h1>Đàm Văn Nguyên xyzzzz</h1>
      <h1>NextJS CI/CD Demo</h1>
      <pre>{JSON.stringify(data)}</pre>
    </div>
  );
}