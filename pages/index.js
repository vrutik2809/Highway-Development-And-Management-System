import Navbar from "../components/Navbar";
import Footer from "../components/Footer/Footer";

import { container } from "/styles/jss/nextjs-material-kit.js";

export default (props) => {
  return (
    <div>
      <Navbar />
      <div className={container}>
        <h1>This is test</h1>
      </div>
      <Footer />
    </div>
  );
}
