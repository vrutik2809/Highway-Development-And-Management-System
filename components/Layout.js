import Navbar from "./Navbar"
import Footer from "./Footer/Footer"

export default ({ children }) => {
    return (
        <div>
            <Navbar />
            {children}
            <Footer />
        </div>
    )
}