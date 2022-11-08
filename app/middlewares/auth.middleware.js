import { flags } from "../enums";

export const auth = async (req, res, next) => {
    try {
        return flags.SUCCESS;
    } catch (error) {
        console.log(error);
        return flags.ERROR;
    }
}