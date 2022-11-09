import Navbar from "../components/Navbar";
import Footer from "../components/Footer/Footer";
import GridContainer from "../components/Grid/GridContainer";
import GridItem from "../components/Grid/GridItem";

import Highway from "../components/Highway";

import { makeStyles } from "@material-ui/core/styles";
import styles from "../styles/jss/nextjs-material-kit/pages/indexPage.js";

const useStyles = makeStyles(styles);

export default (props) => {
  const classes = useStyles();
  const xs = 12;
  const sm = 6;
  const md = 4;
  return (
    <div>
      <Navbar />
      <GridContainer className={classes.gridContainer}>
        <GridItem xs={xs} sm={sm} md={md}>
          <Highway data={{
            type: "NH",
            number: 1,
            length: 93.4,
            start_location: "Ahmedabad",
            end_location: "Vadodara",
            img_src: "https://maps.wikimedia.org/img/osm-intl,a,a,a,300x200.png?lang=en&domain=en.wikipedia.org&title=Ahmedabad%E2%80%93Vadodara+Expressway&revid=1117511725&groups=_8e471d3425e93247c29536f44e5b00d912ab8acd",
            img_href: "https://en.wikipedia.org/wiki/Ahmedabad%E2%80%93Vadodara_Expressway#/map/0"
          }} />
        </GridItem>
        <GridItem xs={xs} sm={sm} md={md}>
          <Highway data={{
            type: "NH",
            number: 1,
            length: 93.4,
            start_location: "Ahmedabad",
            end_location: "Vadodara",
            img_src: "https://maps.wikimedia.org/img/osm-intl,a,a,a,300x200.png?lang=en&domain=en.wikipedia.org&title=Ahmedabad%E2%80%93Vadodara+Expressway&revid=1117511725&groups=_8e471d3425e93247c29536f44e5b00d912ab8acd",
            img_href: "https://en.wikipedia.org/wiki/Ahmedabad%E2%80%93Vadodara_Expressway#/map/0"
          }} />
        </GridItem>
        <GridItem xs={xs} sm={sm} md={md}>
          <Highway data={{
            type: "NH",
            number: 1,
            length: 93.4,
            start_location: "Ahmedabad",
            end_location: "Vadodara",
            img_src: "https://maps.wikimedia.org/img/osm-intl,a,a,a,300x200.png?lang=en&domain=en.wikipedia.org&title=Ahmedabad%E2%80%93Vadodara+Expressway&revid=1117511725&groups=_8e471d3425e93247c29536f44e5b00d912ab8acd",
            img_href: "https://en.wikipedia.org/wiki/Ahmedabad%E2%80%93Vadodara_Expressway#/map/0"
          }} />
        </GridItem>
        <GridItem xs={xs} sm={sm} md={md}>
          <Highway data={{
            type: "NH",
            number: 1,
            length: 93.4,
            start_location: "Ahmedabad",
            end_location: "Vadodara",
            img_src: "https://maps.wikimedia.org/img/osm-intl,a,a,a,300x200.png?lang=en&domain=en.wikipedia.org&title=Ahmedabad%E2%80%93Vadodara+Expressway&revid=1117511725&groups=_8e471d3425e93247c29536f44e5b00d912ab8acd",
            img_href: "https://en.wikipedia.org/wiki/Ahmedabad%E2%80%93Vadodara_Expressway#/map/0"
          }} />
        </GridItem>
      </GridContainer>
      <Footer />
    </div>
  );
}
