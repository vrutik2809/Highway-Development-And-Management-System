import Navbar from "../../components/Navbar";
import Footer from "../../components/Footer/Footer";
import Container from '@mui/material/Container';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select from '@mui/material/Select';
import { DataGrid } from '@mui/x-data-grid';
import { Button ,Box} from "@mui/material";

import { useState, useEffect } from "react";

import { makeStyles } from "@material-ui/core/styles";

import styles from "../../styles/jss/nextjs-material-kit/pages/selectPage.js";

import axiosInstance from "../../utils/Axios";

const useStyles = makeStyles(styles);

export default (props) => {
    const classes = useStyles();
    const [selectedTableName, setSelectedTableName] = useState("highways");
    const [tableNames, setTableNames] = useState([]);
    const [tableRows, setTableRows] = useState([]);
    const [tableColumns, setTableColumns] = useState([]);
    useEffect(() => {
        const abortController = new AbortController();
        const getTableNames = async () => {
            try {
                const promise = axiosInstance.get("/static/tables", { signal: abortController.signal });
                const { data } = await promise;
                console.log(data.data);
                setTableNames(data.data);
            } catch (error) {
                console.log(error);
            }
        };
        getTableNames();
        return () => {
            abortController.abort();
        }
    }, []);
    const fetchTableColumns = async () => {
        try {
            const promise = axiosInstance.get(`/static/columns/?table_name=${selectedTableName}`);
            const { data } = await promise;
            setTableColumns(data.data.map((column) => {
                return {
                    field: column.column_name,
                    headerName: column.column_name,
                    width: 200,
                }
            }));
        } catch (error) {
            console.log(error);
        }
    }
    const fetchTableRows = async () => {
        try {
            const promise = axiosInstance.get(`/static/rows/?table_name=${selectedTableName}`);
            const { data } = await promise;
            setTableRows(data.data);
        } catch (error) {
            console.log(error);
        }
    }
    const generateTableData = async () => {
        try {
            await fetchTableColumns();
            await fetchTableRows();
        } catch (error) {
            console.log(error);
        }
    }
    return (
        <>
            <Navbar />
            <Container className={classes.parentContainer}>
                <FormControl className={classes.selectContainer}>
                    <InputLabel id="selectedTableName">Table Name</InputLabel>
                    <Select
                        labelId="selectedTableName"
                        id="selectedTableName"
                        value={selectedTableName}
                        label="Table Name"
                        onChange={(e) => setSelectedTableName(e.target.value)}
                        className={classes.selectBox}
                    >
                        {tableNames && tableNames.map((tableName) => (
                            <MenuItem key={tableName.id} value={tableName.table_name} className={classes.menuItem}>{tableName.table_name}</MenuItem>
                        ))}
                    </Select>
                    <Button variant="contained" onClick={generateTableData} className={classes.selectBtn}>
                        Select
                    </Button>
                </FormControl>
                <Box sx={{ width: '100%'}}>
                    {tableRows && tableColumns && <DataGrid
                        rows={tableRows}
                        columns={tableColumns}
                        pageSize={10}
                        autoHeight={true}
                    />}   
                </Box>
            </Container>
            <Footer />
        </>
    )
}