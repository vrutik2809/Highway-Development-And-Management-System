import Navbar from "../../components/Navbar";
import Footer from "../../components/Footer/Footer";
import GridContainer from "../../components/Grid/GridContainer";
import GridItem from "../../components/Grid/GridItem";
import Highway from "../../components/Highway";
import CircularProgress from "@material-ui/core/CircularProgress";

import { useState, useEffect } from "react";

import { makeStyles } from "@material-ui/core/styles";
import styles from "../../styles/jss/nextjs-material-kit/pages/highwaysPage.js";

const useStyles = makeStyles(styles);

export default (props) => {
  const classes = useStyles();
  const [highways, setHighways] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  useEffect(() => {
    const abortController = new AbortController();
    const getHighways = async () => {
      const res = await fetch("/api", {
        signal: abortController.signal
      });
      const { data } = await res.json();
      setHighways(data);
      setIsLoading(false);
    };
    getHighways();
    return () => {
      console.log('fetch aborted');
      abortController.abort();
    }
  }, []);
  const xs = 12;
  const sm = 6;
  const md = 4;
  return (
    <>
      <Navbar />
      <GridContainer className={classes.gridContainer}>
        {isLoading && <CircularProgress />}
        {highways && highways.map((highway) => {
          return (
            <GridItem xs={xs} sm={sm} md={md} key={highway.id}>
              <Highway data={highway} />
            </GridItem>
          );
        })}
      </GridContainer>
      <Footer />
    </>
  );
}

{/* <Highway data={{
  type: "NH",
  number: 1,
  length: 93.4,
  start_location: "Ahmedabad",
  end_location: "Vadodara",
  img_src: "https://maps.wikimedia.org/img/osm-intl,a,a,a,300x200.png?lang=en&domain=en.wikipedia.org&title=Ahmedabad%E2%80%93Vadodara+Expressway&revid=1117511725&groups=_8e471d3425e93247c29536f44e5b00d912ab8acd",
  img_href: "https://en.wikipedia.org/wiki/Ahmedabad%E2%80%93Vadodara_Expressway#/map/0"
}} /> */}