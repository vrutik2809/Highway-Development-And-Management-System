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
        <Card>
            <CardHeader color="primary">
                <h4>{data.type} {data.id}</h4>
            </CardHeader>
            <CardBody>
                <p>Length: {data.length} km</p>
                <p>Start Location: {data.start_location}</p>
                <p>End Location: {data.end_location}</p>
                <p>Build Year: {data.build_year}</p>
                <p>cost: &#8377;{data.cost} cr</p>
            </CardBody>
        </Card>
    );
}

Highway.propTypes = {
    data: PropTypes.shape({
        type: PropTypes.string,
        id: PropTypes.number,
        length: PropTypes.number,
        start_location: PropTypes.string,
        end_location: PropTypes.string,
        build_year: PropTypes.number,
        cost: PropTypes.number,
    }).isRequired
}
