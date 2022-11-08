import Header from "./Header/Header"
import HeaderLinks from "./Header/HeaderLinks"

import { makeStyles } from "@material-ui/core/styles";

import styles from "/styles/jss/nextjs-material-kit/pages/components.js";

const useStyles = makeStyles(styles);

export default (props) => {
    const classes = useStyles();
    const { ...rest } = props;
    return (
        <div>
            <Header
                brand="Highway Development And Management System"
                rightLinks={<HeaderLinks />}
                // fixed
                color="primary"
                changeColorOnScroll={{
                    height: 400,
                    color: "white"
                }}
                {...rest}
            />
        </div>
    );
}