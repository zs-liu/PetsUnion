package tools;

public class StaticPara {

    public class LoginRegisterPara {
        public static final int success = 0;
        public static final int loginWrongPassword = 1;
        public static final int registerExistsName = 2;
        public static final int registerExistsShop = 6;
        public static final int sqlError = 3;
        public static final int invalid = 4;
        public static final int unknown = 5;
    }

    public class ShopDetailServletPara {
        public static final int fullFlag = 0;
        public static final int updateFlag = 1;
    }

    public class ReservationStatusPara {
        public static final int toDo = 0;
        public static final int confirm = 1;
        public static final int haveDone = 2;
        public static final int delete = 3;
    }

    public class ShopDetailUpdateServletPara {
        public static final int priceInsert = 0;
        public static final int priceDelete = 1;
        public static final int basic = 2;
    }

    public class SqlPara {
        public static final int success = 0;
        public static final int sqlError = 1;
        public static final int invalid = 2;
    }

    public class ShowPara {
        public static final int perPage = 10;
    }
}
