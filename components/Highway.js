import Card from "./Card/Card.js";
import CardBody from "./Card/CardBody.js";
import CardHeader from "./Card/CardHeader.js";
import CardFooter from "./Card/CardFooter.js";
import Link from "next/link";

import PropTypes from "prop-types";

import { makeStyles } from "@material-ui/core/styles";
import styles from "../styles/jss/nextjs-material-kit/components/highwayStyle.js";

const useStyles = makeStyles(styles);

export default function Highway(props) {
    const classes = useStyles();
    const {data , ...rest} = props;
    return (
        <>
            <Card>
                <CardHeader color="primary">
                    <h4>{data.type} {data.number}</h4>
                </CardHeader>
                <CardBody>
                    <Link href={data.img_href}>
                        <a target="_blank">
                            <img src={data.img_src} alt="Highway" />
                        </a>
                    </Link>
                    <p>Length: {data.length} km</p>
                    <p>Start Location: {data.start_location}</p>
                    <p>End Location: {data.end_location}</p>
                </CardBody>
                <CardFooter>
                    <p>Footer</p>
                </CardFooter>
            </Card>
        </>
    );
}

Highway.propTypes = {
    data: PropTypes.shape({
        type: PropTypes.string,
        number: PropTypes.number,
        length: PropTypes.number,
        start_location: PropTypes.string,
        end_location: PropTypes.string,
        img_src: PropTypes.string,
        img_href: PropTypes.string,
    }).isRequired
}
