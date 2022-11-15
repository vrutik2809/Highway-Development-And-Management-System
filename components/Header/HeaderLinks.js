/*eslint-disable*/
import React from "react";
import Link from "next/link";

// @material-ui/core components
import { makeStyles } from "@material-ui/core/styles";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";

// core components
import Button from "/components/CustomButtons/Button.js";

import styles from "/styles/jss/nextjs-material-kit/components/headerLinksStyle.js";

const useStyles = makeStyles(styles);

export default function HeaderLinks(props) {
  const classes = useStyles();
  return (
    <List className={classes.list}>
      <ListItem className={classes.listItem}>
        <Button
          href="/highways"
          color="transparent"
          className={classes.navLink}
        >
          Highways
        </Button>
      </ListItem>
      <ListItem className={classes.listItem}>
        <Button
          href="/notices"
          color="transparent"
          className={classes.navLink}
        >
          Notices
        </Button>
      </ListItem>
      <ListItem className={classes.listItem}>
        <Button
          href="/tenders"
          color="transparent"
          className={classes.navLink}
        >
          Tenders
        </Button>
      </ListItem>
      <ListItem className={classes.listItem}>
        <Button
          href="/login"
          color="transparent"
          className={classes.navLink}
        >
          Login
        </Button>
      </ListItem>
    </List>
  );
}
