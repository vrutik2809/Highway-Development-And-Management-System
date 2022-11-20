import axios from "axios";
// import SessionStorage from "../contexts/SessionStorage";

const baseURL = "http://localhost:3000/api";

const AxiosInstance = () => {
//   const { token } = SessionStorage.getUserSession();
  const client = axios.create({
    baseURL: baseURL,
  });

  return client;
};

export default AxiosInstance();