import axios from "axios";

const AxiosInstance = () => {
  const client = axios.create({
    baseURL: process.env.NEXT_PUBLIC_BASE_URL,
  });

  return client;
};

export default AxiosInstance();