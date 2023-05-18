--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
-- Dumped by pg_dump version 14.7 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: tpl622_1
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO tpl622_1;

--
-- Name: participants; Type: TABLE; Schema: public; Owner: tpl622_1
--

CREATE TABLE public.participants (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    nickname character varying(255) NOT NULL,
    given_name character varying(255) NOT NULL,
    family_name character varying(255) NOT NULL,
    picture character varying(255) NOT NULL,
    sub character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.participants OWNER TO tpl622_1;

--
-- Name: participants_id_seq; Type: SEQUENCE; Schema: public; Owner: tpl622_1
--

CREATE SEQUENCE public.participants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.participants_id_seq OWNER TO tpl622_1;

--
-- Name: participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tpl622_1
--

ALTER SEQUENCE public.participants_id_seq OWNED BY public.participants.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: tpl622_1
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    category character varying(255),
    text text NOT NULL,
    "testCases" json
);


ALTER TABLE public.questions OWNER TO tpl622_1;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: tpl622_1
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO tpl622_1;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tpl622_1
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: participants id; Type: DEFAULT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants ALTER COLUMN id SET DEFAULT nextval('public.participants_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: tpl622_1
--



--
-- Data for Name: participants; Type: TABLE DATA; Schema: public; Owner: tpl622_1
--



--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: tpl622_1
--

INSERT INTO public.questions (id, category, text, "testCases") VALUES (1, 'booleans', 'The parameter weekday is true if it is a weekday, and the parameter vacation is true if we are on vacation. We sleep in if it is not a weekday or we''re on vacation. Return true if we sleep in.', '["sleep_in(false, false) → true;","sleep_in(true, false) → false;","sleep_in(false, true) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (2, 'integers', 'Given an int n, return the absolute difference between n and 21, except return double the absolute difference if n is over 21.', '["diff21(19) → 2;","diff21(10) → 11;","diff21(21) → 0;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (3, 'booleans', 'Given an int n, return true if it is within 10 of 100 or 200. Note: abs(num) computes the absolute value of a number.', '["near_hundred(93) → true;","near_hundred(90) → true;","near_hundred(89) → false;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (4, 'strings', 'Given a non-empty string and an int n, return a new string where the char at index n has been removed. The value of n will be a valid index of a char in the original string (i.e. n will be in the range 0..len(str)-1 inclusive).', '["missing_char(''kitten'', 1) → ''ktten'';","missing_char(''kitten'', 0) → ''itten'';","missing_char(''kitten'', 4) → ''kittn'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (5, 'booleans', 'We have two monkeys, a and b, and the parameters a_smile and b_smile indicate if each is smiling. We are in trouble if they are both smiling or if neither of them is smiling. Return true if we are in trouble.', '["monkey_trouble(true, true) → true;","monkey_trouble(false, false) → true;","monkey_trouble(true, false) → false;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (6, 'booleans', 'We have a loud talking parrot. The ''hour'' parameter is the current hour time in the range 0..23. We are in trouble if the parrot is talking and the hour is before 7 or after 20. Return true if we are in trouble.', '["parrot_trouble(true, 6) → true;","parrot_trouble(true, 7) → false;","parrot_trouble(false, 6) → false;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (7, 'booleans', 'Given 2 int values, return true if one is negative and one is positive. Except if the parameter ''negative'' is true, then return true only if both are negative.', '["pos_neg(1, -1, false) → true;","pos_neg(-1, 1, false) → true;","pos_neg(-4, -5, true) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (8, 'strings', 'Given a string, return a new string where the first and last chars have been exchanged.', '["front_back(''code'') → ''eodc'';","front_back(''a'') → ''a'';","front_back(''ab'') → ''ba'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (9, 'integers', 'Given two int values, return their sum. Unless the two values are the same, then return double their sum.', '["sum_double(1, 2) → 3;","sum_double(3, 2) → 5;","sum_double(2, 2) → 8;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (10, 'strings', 'Given a string, return a new string where ''not'' has been added as the first word in the string. However, if the string already begins with ''not'', return the string unchanged.', '["not_string(''candy'') → ''not candy'';","not_string(''x'') → ''not x'';","not_string(''not bad'') → ''not bad'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (11, 'strings', 'Given a string and a non-negative int n, we''ll say that the front of the string is the first 3 chars, or whatever is there if the string is less than length 3. Return n copies of the front.', '["front_times(''Chocolate'', 2) → ''ChoCho'';","front_times(''Chocolate'', 3) → ''ChoChoCho'';","front_times(''Ok'', 4) → ''OkOkOkOk'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (12, 'strings', 'Given a string and a non-negative int n, return a larger string that is n copies of the original string.', '["string_times(''Hi'', 2) → ''HiHi'';","string_times(''Hi'', 3) → ''HiHiHi'';","string_times(''Hi'', 1) → ''Hi'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (13, 'strings', 'Given a non-empty string like ''Code'' return a string like ''CCoCodCode''.', '["string_splosion(''Code'') → ''CCoCodCode'';","string_splosion(''abc'') → ''aababc'';","string_splosion(''ab'') → ''aab'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (14, 'strings', 'Given a string, return the count of the number of times that a substring length 2 appears in the string and also as the last 2 chars of the string, so ''hixxxhi'' yields 1 (we won''t count the end substring).', '["last2(''hixxhi'') → 1;","last2(''xaxxaxaxx'') → 1;","last2(''axxxaaxx'') → 2;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (15, 'strings', 'Given a string, return a new string made of every other char starting with the first, so ''Hello'' yields ''Hlo''.', '["string_bits(''Hello'') → ''Hlo'';","string_bits(''Hi'') → ''H'';","string_bits(''Heeololeo'') → ''Hello'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (16, 'strings', 'Given 2 strings, a and b, return the number of the positions where they contain the same length 2 substring. So ''xxcaazz'' and ''xxbaaz'' yields 3, since the ''xx'', ''aa'', and ''az'' substrings appear in the same place in both strings.', '["string_match(''xxcaazz'', ''xxbaaz'') → 3;","string_match(''abc'', ''abc'') → 2;","string_match(''abc'', ''axc'') → 0;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (17, 'strings', 'Given a string representing a name, e.g. ''Bob'', return a greeting of the form ''Hello Bob!''', '["hello_name(''Bob'') → ''Hello Bob!'';","hello_name(''Alice'') → ''Hello Alice!'';","hello_name(''X'') → ''Hello X!'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (18, 'strings', 'Given an ''out'' string length 4, such as ''<<>>'', and a word, return a new string where the word is in the middle of the out string, e.g. ''<<word>>''.', '["make_out_word(''<<>>'', ''Yay'') → ''<<Yay>>'';","make_out_word(''<<>>'', ''WooHoo'') → ''<<WooHoo>>'';","make_out_word(''[[]]'', ''word'') → ''[[word]]'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (19, 'strings', 'Given a string of even length, return the first half. So the string ''WooHoo'' yields ''Woo''.', '["first_half(''WooHoo'') → ''Woo'';","first_half(''HelloThere'') → ''Hello'';","first_half(''abcdef'') → ''abc'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (20, 'strings', 'Given 2 strings, return their concatenation, except omit the first char of each. The strings will be at least length 1.', '["non_start(''Hello'', ''There'') → ''ellohere'';","non_start(''java'', ''code'') → ''avaode'';","non_start(''shotl'', ''java'') → ''hotlava'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (21, 'strings', 'Given two strings, a and b, return the result of putting them together in the order abba, e.g. ''Hi'' and ''Bye'' returns ''HiByeByeHi''.', '["make_abba(''Hi'', ''Bye'') → ''HiByeByeHi'';","make_abba(''Yo'', ''Alice'') → ''YoAliceAliceYo'';","make_abba(''What'', ''Up'') → ''WhatUpUpWhat'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (22, 'strings', 'Given a string, return a new string made of 3 copies of the last 2 chars of the original string. The string length will be at least 2.', '["extra_end(''Hello'') → ''lololo'';","extra_end(''ab'') → ''ababab'';","extra_end(''Hi'') → ''HiHiHi'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (23, 'strings', 'Given a string, return a version without the first and last char, so ''Hello'' yields ''ell''. The string length will be at least 2.', '["without_end(''Hello'') → ''ell'';","without_end(''java'') → ''av'';","without_end(''coding'') → ''odin'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (24, 'strings', 'Given a string, return a ''rotated left 2'' version where the first 2 chars are moved to the end. The string length will be at least 2.', '["left2(''Hello'') → ''lloHe'';","left2(''java'') → ''vaja'';","left2(''Hi'') → ''Hi'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (25, 'strings', 'The web is built with HTML strings like ''<i>Yay</i>'' which draws Yay as italic text. In this example, the ''i'' tag makes <i> and </i> which surround the word ''Yay''. Given tag and word strings, create the HTML string with tags around the word, e.g. ''<i>Yay</i>''', '["make_tags(''i'', ''Yay'') → ''<i>Yay</i>'';","make_tags(''i'', ''Hello'') → ''<i>Hello</i>'';","make_tags(''cite'', ''Yay'') → ''<cite>Yay</cite>'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (26, 'strings', 'Given a string, return the string made of its first two chars, so the String ''Hello'' yields ''He''. If the string is shorter than length 2, return whatever there is, so ''X'' yields ''X'', and the empty string '' '' yields the empty string '' ''.', '["first_two(''Hello'') → ''He'';","first_two(''abcdefg'') → ''ab'';","first_two(''ab'') → ''ab'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (27, 'strings', 'Given 2 strings, a and b, return a string of the form short+long+short, with the shorter string on the outside and the longer string on the inside. The strings will not be the same length, but they may be empty (length 0).', '["combo_string(''Hello'', ''hi'') → ''hiHellohi'';","combo_string(''hi'', ''Hello'') → ''hiHellohi'';","combo_string(''aaa'', ''b'') → ''baaab'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (28, 'strings', 'Given a string, return a string where for every char in the original, there are two chars.', '["double_char(''The'') → ''TThhee'';","double_char(''AAbb'') → ''AAAAbbbb'';","double_char(''Hi-There'') → ''HHii--TThheerree'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (29, 'strings', 'Return the number of times that the string ''code'' appears anywhere in the given string, except we''ll accept any letter for the ''d'', so ''cope'' and ''cooe'' count.', '["count_code(''aaacodebbb'') → 1;","count_code(''codexxcode'') → 2;","count_code(''cozexxcope'') → 2;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (30, 'strings', 'Return the number of times that the string ''hi'' appears anywhere in the given string.', '["count_hi(''abc hi ho'') → 1;","count_hi(''ABChi hi'') → 2;","count_hi(''hihi'') → 2;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (31, 'strings', 'Given two strings, return true if either of the strings appears at the very end of the other string, ignoring upper/lower case differences (in other words, the computation should not be ''case sensitive''). ', '["end_other(''Hiabc'', ''abc'') → true;","end_other(''AbC'', ''HiaBc'') → true;","end_other(''abc'', ''abXabc'') → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (32, 'strings', 'Return true if the string ''cat'' and ''dog'' appear the same number of times in the given string. ', '["cat_dog(''catdog'') → true;","cat_dog(''catcat'') → false;","cat_dog(''1cat1cadodog'') → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (33, 'strings', 'Return true if the given string contains an appearance of ''xyz'' where the xyz is not directly preceded by a period (.). So ''xxyz'' counts but ''x.xyz'' does not.', '["xyz_there(''abcxyz'') → true;","xyz_there(''abc.xyz'') → false;","xyz_there(''xyz.abc'') → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (34, 'strings', 'Given a day of the week encoded as 0=Sun, 1=Mon, 2=Tue, ...6=Sat, and a boolean indicating if we are on vacation, return a string of the form ''7:00'' indicating when the alarm clock should ring. Weekdays, the alarm should be ''7:00'' and on the weekend it should be ''10:00''. Unless we are on vacation -- then on weekdays it should be ''10:00'' and weekends it should be ''off''.', '["alarm_clock(1, false) → ''7:00'';","alarm_clock(5, false) → ''7:00'';","alarm_clock(0, false) → ''10:00'';"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (35, 'arrays', 'Given an array of ints, return true if one of the first 4 elements in the array is a 9. The array length may be less than 4.', '["array_front9([1, 2, 9, 3, 4]) → true;","array_front9([1, 2, 3, 4, 9]) → false;","array_front9([1, 2, 3, 4, 5]) → false;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (36, 'arrays', 'Given an array of ints, return true if the sequence of numbers 1, 2, 3 appears in the array somewhere.', '["array123([1, 1, 2, 3, 1]) → true;","array123([1, 1, 2, 4, 1]) → false;","array123([1, 1, 2, 1, 2, 3]) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (37, 'arrays', 'Given an array of ints, return the number of 9''s in the array.', '["array_count9([1, 2, 9]) → 1;","array_count9([1, 9, 9]) → 2;","array_count9([1, 9, 9, 3, 9]) → 3;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (38, 'arrays', 'Given an array of ints, return true if 6 appears as either the first or last element in the array. The array will be length 1 or more. You must solve this in O(1)  time, which means without looping through the array.', '["first_last6([1, 2, 6]) → true;","first_last6([6, 1, 2, 3]) → true;","first_last6([13, 6, 1, 2, 3]) → false;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (39, 'arrays', 'Given 2 arrays of ints, a and b, return true if they have the same first element or they have the same last element. Both arrays will be length 1 or more.', '["common_end([1, 2, 3], [7, 3]) → true;","common_end([1, 2, 3], [7, 3, 2]) → false;","common_end([1, 2, 3], [1, 3]) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (40, 'arrays', 'Given an array of ints with a length of 3, return a new array with the elements in reverse order.', '["reverse3([1, 2, 3]) → [3, 2, 1];","reverse3([5, 11, 9]) → [9, 11, 5];","reverse3([7, 0, 0]) → [0, 0, 7];"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (41, 'arrays', 'Given 2 int arrays, a and b, each length 3, return a new array length 2 containing their middle elements.', '["middle_way([1, 2, 3], [4, 5, 6]) → [2, 5];","middle_way([7, 7, 7], [3, 8, 0]) → [7, 8];","middle_way([5, 2, 9], [1, 4, 5]) → [2, 4];"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (42, 'arrays', 'Given an array of ints, return true if the array is length 1 or more, and the first element and the last element are equal.', '["same_first_last([1, 2, 3]) → false;","same_first_last([1, 2, 3, 1]) → true;","same_first_last([1, 2, 1]) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (43, 'arrays', 'Given 2 int arrays, a and b, each with an odd number of 3 or more as a length, return a new array length 2 containing their middle elements.', '["middle_way([1, 2, 3], [4, 5, 6]) → [2, 5];","middle_way([7, 7, 7, 7, 7], [3, 8, 0]) → [7, 8];","middle_way([3, 4, 1, 2, 5, 8, 9], [1, 4, 5]) → [2, 4];"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (44, 'arrays', 'Given an array of ints length 3, return the sum of all the elements.', '["sum3([1, 2, 3]) → 6;","sum3([5, 11, 2]) → 18;","sum3([7, 0, 0]) → 7;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (45, 'arrays', 'Given an array of ints length 3, figure out which is larger, the first or last element in the array, and set all the other elements to be that value. Return the changed array. Try to do this in O(1) space, which means without initializing a new array. ', '["max_end3([1, 2, 3]) → [3, 3, 3];","max_end3([11, 5, 9]) → [11, 11, 11];","max_end3([2, 11, 3]) → [3, 3, 3];"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (46, 'arrays', ' Given an array of ints, return a new array length 2 containing the first and last elements from the original array. The original array will be length 1 or more.', '["make_ends([1, 2, 3]) → [1, 3];","make_ends([1, 2, 3, 4]) → [1, 4];","make_ends([7, 4, 6, 2]) → [7, 2];"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (47, 'arrays', 'Given an array of ints length 3, return an array with the elements ''rotated left''.', '["rotate_left3([1, 2, 3]) → [2, 3, 1];","rotate_left3([5, 11, 9]) → [11, 9, 5];","rotate_left3([7, 0, 0]) → [0, 0, 7];"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (48, 'arrays', 'Given an array of ints, return the sum of the first 2 elements in the array. If the array length is less than 2, just sum up the elements that exist, returning 0 if the array is length 0.', '["sum2([1, 2, 3]) → 3;","sum2([1, 1]) → 2;","sum2([1, 1, 1, 1]) → 2;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (49, 'arrays', 'Given an int array length 2, return true if it contains a 2 or a 3.', '["has23([2, 5]) → true;","has23([4, 3]) → true;","has23([4, 5]) → false;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (50, 'arrays', 'Return the sum of the numbers in the array, returning 0 for an empty array. Except the number 13 is very unlucky, so it does not count and numbers that come immediately after a 13 also do not count.', '["sum13([1, 2, 2, 1]) → 6;","sum13([1, 1]) → 2;","sum13([1, 2, 2, 1, 13]) → 6;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (51, 'arrays', 'Given an array length 1 or more of ints, return the difference between the largest and smallest values in the array. Try not to use any in-built function for calculating min or max. ', '["big_diff([10, 3, 5, 6]) → 7;","big_diff([7, 2, 10, 9]) → 8;","big_diff([2, 10, 7, 2]) → 8;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (52, 'arrays', 'Return the sum of the numbers in the array, except ignore sections of numbers starting with a 6 and extending to the next 7 (every 6 will be followed by at least one 7). Return 0 for no numbers.', '["sum67([1, 2, 2]) → 5;","sum67([1, 2, 2, 6, 99, 99, 7]) → 5;","sum67([1, 1, 6, 7, 2]) → 4;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (53, 'arrays', 'Given an array of ints, return true if the array contains a 2 next to a 2 somewhere.', '["has22([1, 2, 2]) → true;","has22([1, 2, 1, 2]) → false;","has22([2, 1, 2]) → false;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (54, 'arrays', 'Write a function that returns the first element in an array. ', '["firstElement([1, 2, 3, 4, 5]) → 1;","firstElement([5, 6, 7, 8, 9, ]) → 5;","firstElement([12, 6, 47, 18, 91, ]) → 12;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (55, 'arrays', 'There are two arrays with individual values, write a function to compute the sum of each individual index value from the given arrays.', '["sumOfTwoArrays([1,0,2,3,4], [3,5,6,7,8,13]) → [4, 5, 8, 10, 12, 17];","sumOfTwoArrays([7, 3, 9, 5], [2, 4, 1, 2]) → [9, 7, 10, 7];","sumOfTwoArrays([10, 10, 10, 10], [2, 4, 6, 8]) → [12, 14, 16, 18];"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (56, 'booleans', 'When squirrels get together for a party, they like to have acorns. A squirrel party is successful when the number of acorns is between 40 and 60, inclusive. Unless it is the weekend, in which case there is no upper bound on the number of acorns. Return true if the party with the given values is successful, or false otherwise.', '["acorns_party(30, false) → false;","acorns_party(50, false) → true;","acorns_party(70, true) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (57, 'booleans', 'You are driving a little too fast, and a police officer stops you. Write code to compute the result, encoded as an int value: 0=no ticket, 1=small ticket, 2=big ticket. If speed is 60 or less, the result is 0. If speed is between 61 and 80 inclusive, the result is 1. If speed is 81 or more, the result is 2. Unless it is your birthday -- on that day, your speed can be 5 higher in all cases.', '["caught_speeding(60, false) → 0;","caught_speeding(65, false) → 1;","caught_speeding(65, true) → 0;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (58, 'integers', 'The number 6 is a truly great number. Given two int values, a and b, return true if either one is 6. Or if their sum or difference is 6.', '["love6(6, 4) → true;","love6(4, 5) → false;","love6(1, 5) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (59, 'integers', 'Given 2 ints, a and b, return their sum. However, sums in the range 10..19 inclusive, are forbidden, so in that case just return 20.', '["sorta_sum(3, 4) → 7;","sorta_sum(9, 4) → 20;","sorta_sum(10, 11) → 21;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (60, 'integers', 'You and your date are trying to get a table at a restaurant. The parameter ''you'' is the stylishness of your clothes, in the range 0..10, and ''date'' is the stylishness of your date''s clothes. The result ‘getting the table’ is encoded as an int value with 0=no, 1=maybe, 2=yes. If either of you is very stylish, 8 or more, then the result is 2 (yes). With the exception that if either of you has style of 2 or less, then the result is 0 (no). Otherwise the result is 1 (maybe).', '["date_fashion(5, 10) → 2;","date_fashion(5, 2) → 0;","date_fashion(5, 5) → 1;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (61, 'integers', 'We want make a package of goal kilos of chocolate. We have small bars (1 kilo each) and big bars (5 kilos each). Return the number of small bars to use, assuming we always use big bars before small bars. Return -1 if it can''t be done.', '["make_chocolate(4, 1, 9) → 4;","make_chocolate(4, 1, 10) → -1;","make_chocolate(4, 1, 7) → 2;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (62, 'integers', 'Create a function that accepts an integer and checks if it''s even or odd.', '["evenOrOdd(1) → // Odd;","evenOrOdd(2) → // Even;","evenOrOdd(3) →  // Odd;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (63, 'integers', 'Given 3 int values, a b c, return their sum. However, if one of the values is 13 then it does not count towards the sum and values to its right do not count. So for example, if b is 13, then both b and c do not count.', '["lucky_sum(1, 2, 3) → 6;","lucky_sum(1, 2, 13) → 3;","lucky_sum(1, 13, 3) → 1;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (64, 'integers', 'Given 3 int values, a b c, return their sum. However, if one of the values is the same as another of the values, it does not count towards the sum.', '["lone_sum(1, 2, 3) → 6;","lone_sum(3, 2, 3) → 2;","lone_sum(3, 3, 3) → 0;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (65, 'integers', 'For this problem, we''ll round an int value up to the next multiple of 10 if its rightmost digit is 5 or more, so 15 rounds up to 20. Alternately, round down to the previous multiple of 10 if its rightmost digit is less than 5, so 12 rounds down to 10. Given 3 ints, a b c, return the sum of their rounded values. To avoid code repetition, write a separate helper ''def round10(num):'' and call it 3 times. Write the helper entirely below and at the same indent level as round_sum().', '["round_sum(16, 17, 18) → 60;","round_sum(12, 13, 14) → 30;","round_sum(6, 4, 4) → 10;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (66, 'booleans', 'Given a number n, return true if n is in the range 1..10, inclusive. Unless outside_mode is true, in which case return true if the number is less or equal to 1, or greater or equal to 10.', '["in1to10(5, false) → true;","in1to10(11, false) → false;","in1to10(11, true) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (67, 'booleans', 'The squirrels in Palo Alto spend most of the day playing. In particular, they play if the temperature is between 60 and 90 (inclusive). Unless it is summer, then the upper limit is 100 instead of 90. Given an int temperature and a boolean is_summer, return true if the squirrels play and false otherwise.', '["squirrel_play(70, false) → true;","squirrel_play(95, false) → false;","squirrel_play(95, true) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (68, 'booleans', 'Given a non-negative number ''num'', return true if num is within 2 of a multiple of 10.', '["near_ten(12) → true;","near_ten(17) → false;","near_ten(19) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (69, 'booleans', 'We want to make a row of bricks that is goal inches long. We have a number of small bricks (1 inch each) and big bricks (5 inches each). Return true if it is possible to make the goal by choosing from the given bricks. This is a little harder than it looks and can be done without any loops.', '["make_bricks(3, 1, 8) → true;","make_bricks(3, 1, 9) → false;","make_bricks(3, 2, 10) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (70, 'booleans', 'Given three ints, a b c, return true if one of b or c is ''close'' (differing by at most 1), while the other is ''far'', differing from both other values by 2 or more.', '["close_far(1, 2, 10) → true;","close_far(1, 2, 3) → false;","close_far(4, 1, 3) → true;"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (71, 'booleans', 'Write a function that returns true if the two arguments passed are exactly equal.', '["isEqual(5,5) --> true;","isEqual(''k'',`k`) --> true;","isEqual(''a'',''A'') --> false"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (72, 'booleans', 'Write a function that will tell us if we have monkey trouble based on two arguments. We are in trouble if both monkeys are smiling or if neither of them is smiling. Return true if we are in trouble, false if we are not.', '["monkeyTrouble(''smile'', ''smile'') → True;","monkeyTrouble(''smile'', ''frown'') → False;","monkeyTrouble(''frown'', ''frown'') → True"]');
INSERT INTO public.questions (id, category, text, "testCases") VALUES (73, 'integers', 'Given 2 ints, a and b, return true if one if them is 10 or if their sum is 10.', '["makes10(9, 10) → true;","makes10(9, 9) → false;","makes10(1, 9) → true;"]');


--
-- Name: participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tpl622_1
--

SELECT pg_catalog.setval('public.participants_id_seq', 1, false);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tpl622_1
--

SELECT pg_catalog.setval('public.questions_id_seq', 73, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: participants participants_email_key; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_email_key UNIQUE (email);


--
-- Name: participants participants_email_key1; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_email_key1 UNIQUE (email);


--
-- Name: participants participants_family_name_key; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_family_name_key UNIQUE (family_name);


--
-- Name: participants participants_family_name_key1; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_family_name_key1 UNIQUE (family_name);


--
-- Name: participants participants_given_name_key; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_given_name_key UNIQUE (given_name);


--
-- Name: participants participants_given_name_key1; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_given_name_key1 UNIQUE (given_name);


--
-- Name: participants participants_nickname_key; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_nickname_key UNIQUE (nickname);


--
-- Name: participants participants_nickname_key1; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_nickname_key1 UNIQUE (nickname);


--
-- Name: participants participants_picture_key; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_picture_key UNIQUE (picture);


--
-- Name: participants participants_picture_key1; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_picture_key1 UNIQUE (picture);


--
-- Name: participants participants_pkey; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (id);


--
-- Name: participants participants_sub_key; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_sub_key UNIQUE (sub);


--
-- Name: participants participants_sub_key1; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_sub_key1 UNIQUE (sub);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: questions questions_text_key; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key UNIQUE (text);


--
-- Name: questions questions_text_key1; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key1 UNIQUE (text);


--
-- Name: questions questions_text_key10; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key10 UNIQUE (text);


--
-- Name: questions questions_text_key100; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key100 UNIQUE (text);


--
-- Name: questions questions_text_key101; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key101 UNIQUE (text);


--
-- Name: questions questions_text_key102; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key102 UNIQUE (text);


--
-- Name: questions questions_text_key103; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key103 UNIQUE (text);


--
-- Name: questions questions_text_key104; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key104 UNIQUE (text);


--
-- Name: questions questions_text_key105; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key105 UNIQUE (text);


--
-- Name: questions questions_text_key106; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key106 UNIQUE (text);


--
-- Name: questions questions_text_key107; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key107 UNIQUE (text);


--
-- Name: questions questions_text_key108; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key108 UNIQUE (text);


--
-- Name: questions questions_text_key109; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key109 UNIQUE (text);


--
-- Name: questions questions_text_key11; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key11 UNIQUE (text);


--
-- Name: questions questions_text_key110; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key110 UNIQUE (text);


--
-- Name: questions questions_text_key111; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key111 UNIQUE (text);


--
-- Name: questions questions_text_key112; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key112 UNIQUE (text);


--
-- Name: questions questions_text_key113; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key113 UNIQUE (text);


--
-- Name: questions questions_text_key114; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key114 UNIQUE (text);


--
-- Name: questions questions_text_key115; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key115 UNIQUE (text);


--
-- Name: questions questions_text_key116; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key116 UNIQUE (text);


--
-- Name: questions questions_text_key117; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key117 UNIQUE (text);


--
-- Name: questions questions_text_key118; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key118 UNIQUE (text);


--
-- Name: questions questions_text_key119; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key119 UNIQUE (text);


--
-- Name: questions questions_text_key12; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key12 UNIQUE (text);


--
-- Name: questions questions_text_key120; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key120 UNIQUE (text);


--
-- Name: questions questions_text_key121; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key121 UNIQUE (text);


--
-- Name: questions questions_text_key122; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key122 UNIQUE (text);


--
-- Name: questions questions_text_key123; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key123 UNIQUE (text);


--
-- Name: questions questions_text_key124; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key124 UNIQUE (text);


--
-- Name: questions questions_text_key125; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key125 UNIQUE (text);


--
-- Name: questions questions_text_key126; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key126 UNIQUE (text);


--
-- Name: questions questions_text_key127; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key127 UNIQUE (text);


--
-- Name: questions questions_text_key128; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key128 UNIQUE (text);


--
-- Name: questions questions_text_key129; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key129 UNIQUE (text);


--
-- Name: questions questions_text_key13; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key13 UNIQUE (text);


--
-- Name: questions questions_text_key130; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key130 UNIQUE (text);


--
-- Name: questions questions_text_key131; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key131 UNIQUE (text);


--
-- Name: questions questions_text_key132; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key132 UNIQUE (text);


--
-- Name: questions questions_text_key133; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key133 UNIQUE (text);


--
-- Name: questions questions_text_key134; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key134 UNIQUE (text);


--
-- Name: questions questions_text_key135; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key135 UNIQUE (text);


--
-- Name: questions questions_text_key136; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key136 UNIQUE (text);


--
-- Name: questions questions_text_key137; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key137 UNIQUE (text);


--
-- Name: questions questions_text_key138; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key138 UNIQUE (text);


--
-- Name: questions questions_text_key139; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key139 UNIQUE (text);


--
-- Name: questions questions_text_key14; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key14 UNIQUE (text);


--
-- Name: questions questions_text_key140; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key140 UNIQUE (text);


--
-- Name: questions questions_text_key141; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key141 UNIQUE (text);


--
-- Name: questions questions_text_key142; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key142 UNIQUE (text);


--
-- Name: questions questions_text_key143; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key143 UNIQUE (text);


--
-- Name: questions questions_text_key144; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key144 UNIQUE (text);


--
-- Name: questions questions_text_key145; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key145 UNIQUE (text);


--
-- Name: questions questions_text_key146; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key146 UNIQUE (text);


--
-- Name: questions questions_text_key147; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key147 UNIQUE (text);


--
-- Name: questions questions_text_key148; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key148 UNIQUE (text);


--
-- Name: questions questions_text_key149; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key149 UNIQUE (text);


--
-- Name: questions questions_text_key15; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key15 UNIQUE (text);


--
-- Name: questions questions_text_key150; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key150 UNIQUE (text);


--
-- Name: questions questions_text_key151; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key151 UNIQUE (text);


--
-- Name: questions questions_text_key16; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key16 UNIQUE (text);


--
-- Name: questions questions_text_key17; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key17 UNIQUE (text);


--
-- Name: questions questions_text_key18; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key18 UNIQUE (text);


--
-- Name: questions questions_text_key19; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key19 UNIQUE (text);


--
-- Name: questions questions_text_key2; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key2 UNIQUE (text);


--
-- Name: questions questions_text_key20; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key20 UNIQUE (text);


--
-- Name: questions questions_text_key21; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key21 UNIQUE (text);


--
-- Name: questions questions_text_key22; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key22 UNIQUE (text);


--
-- Name: questions questions_text_key23; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key23 UNIQUE (text);


--
-- Name: questions questions_text_key24; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key24 UNIQUE (text);


--
-- Name: questions questions_text_key25; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key25 UNIQUE (text);


--
-- Name: questions questions_text_key26; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key26 UNIQUE (text);


--
-- Name: questions questions_text_key27; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key27 UNIQUE (text);


--
-- Name: questions questions_text_key28; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key28 UNIQUE (text);


--
-- Name: questions questions_text_key29; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key29 UNIQUE (text);


--
-- Name: questions questions_text_key3; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key3 UNIQUE (text);


--
-- Name: questions questions_text_key30; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key30 UNIQUE (text);


--
-- Name: questions questions_text_key31; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key31 UNIQUE (text);


--
-- Name: questions questions_text_key32; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key32 UNIQUE (text);


--
-- Name: questions questions_text_key33; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key33 UNIQUE (text);


--
-- Name: questions questions_text_key34; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key34 UNIQUE (text);


--
-- Name: questions questions_text_key35; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key35 UNIQUE (text);


--
-- Name: questions questions_text_key36; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key36 UNIQUE (text);


--
-- Name: questions questions_text_key37; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key37 UNIQUE (text);


--
-- Name: questions questions_text_key38; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key38 UNIQUE (text);


--
-- Name: questions questions_text_key39; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key39 UNIQUE (text);


--
-- Name: questions questions_text_key4; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key4 UNIQUE (text);


--
-- Name: questions questions_text_key40; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key40 UNIQUE (text);


--
-- Name: questions questions_text_key41; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key41 UNIQUE (text);


--
-- Name: questions questions_text_key42; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key42 UNIQUE (text);


--
-- Name: questions questions_text_key43; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key43 UNIQUE (text);


--
-- Name: questions questions_text_key44; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key44 UNIQUE (text);


--
-- Name: questions questions_text_key45; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key45 UNIQUE (text);


--
-- Name: questions questions_text_key46; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key46 UNIQUE (text);


--
-- Name: questions questions_text_key47; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key47 UNIQUE (text);


--
-- Name: questions questions_text_key48; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key48 UNIQUE (text);


--
-- Name: questions questions_text_key49; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key49 UNIQUE (text);


--
-- Name: questions questions_text_key5; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key5 UNIQUE (text);


--
-- Name: questions questions_text_key50; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key50 UNIQUE (text);


--
-- Name: questions questions_text_key51; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key51 UNIQUE (text);


--
-- Name: questions questions_text_key52; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key52 UNIQUE (text);


--
-- Name: questions questions_text_key53; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key53 UNIQUE (text);


--
-- Name: questions questions_text_key54; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key54 UNIQUE (text);


--
-- Name: questions questions_text_key55; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key55 UNIQUE (text);


--
-- Name: questions questions_text_key56; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key56 UNIQUE (text);


--
-- Name: questions questions_text_key57; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key57 UNIQUE (text);


--
-- Name: questions questions_text_key58; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key58 UNIQUE (text);


--
-- Name: questions questions_text_key59; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key59 UNIQUE (text);


--
-- Name: questions questions_text_key6; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key6 UNIQUE (text);


--
-- Name: questions questions_text_key60; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key60 UNIQUE (text);


--
-- Name: questions questions_text_key61; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key61 UNIQUE (text);


--
-- Name: questions questions_text_key62; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key62 UNIQUE (text);


--
-- Name: questions questions_text_key63; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key63 UNIQUE (text);


--
-- Name: questions questions_text_key64; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key64 UNIQUE (text);


--
-- Name: questions questions_text_key65; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key65 UNIQUE (text);


--
-- Name: questions questions_text_key66; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key66 UNIQUE (text);


--
-- Name: questions questions_text_key67; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key67 UNIQUE (text);


--
-- Name: questions questions_text_key68; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key68 UNIQUE (text);


--
-- Name: questions questions_text_key69; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key69 UNIQUE (text);


--
-- Name: questions questions_text_key7; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key7 UNIQUE (text);


--
-- Name: questions questions_text_key70; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key70 UNIQUE (text);


--
-- Name: questions questions_text_key71; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key71 UNIQUE (text);


--
-- Name: questions questions_text_key72; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key72 UNIQUE (text);


--
-- Name: questions questions_text_key73; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key73 UNIQUE (text);


--
-- Name: questions questions_text_key74; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key74 UNIQUE (text);


--
-- Name: questions questions_text_key75; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key75 UNIQUE (text);


--
-- Name: questions questions_text_key76; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key76 UNIQUE (text);


--
-- Name: questions questions_text_key77; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key77 UNIQUE (text);


--
-- Name: questions questions_text_key78; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key78 UNIQUE (text);


--
-- Name: questions questions_text_key79; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key79 UNIQUE (text);


--
-- Name: questions questions_text_key8; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key8 UNIQUE (text);


--
-- Name: questions questions_text_key80; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key80 UNIQUE (text);


--
-- Name: questions questions_text_key81; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key81 UNIQUE (text);


--
-- Name: questions questions_text_key82; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key82 UNIQUE (text);


--
-- Name: questions questions_text_key83; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key83 UNIQUE (text);


--
-- Name: questions questions_text_key84; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key84 UNIQUE (text);


--
-- Name: questions questions_text_key85; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key85 UNIQUE (text);


--
-- Name: questions questions_text_key86; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key86 UNIQUE (text);


--
-- Name: questions questions_text_key87; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key87 UNIQUE (text);


--
-- Name: questions questions_text_key88; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key88 UNIQUE (text);


--
-- Name: questions questions_text_key89; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key89 UNIQUE (text);


--
-- Name: questions questions_text_key9; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key9 UNIQUE (text);


--
-- Name: questions questions_text_key90; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key90 UNIQUE (text);


--
-- Name: questions questions_text_key91; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key91 UNIQUE (text);


--
-- Name: questions questions_text_key92; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key92 UNIQUE (text);


--
-- Name: questions questions_text_key93; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key93 UNIQUE (text);


--
-- Name: questions questions_text_key94; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key94 UNIQUE (text);


--
-- Name: questions questions_text_key95; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key95 UNIQUE (text);


--
-- Name: questions questions_text_key96; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key96 UNIQUE (text);


--
-- Name: questions questions_text_key97; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key97 UNIQUE (text);


--
-- Name: questions questions_text_key98; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key98 UNIQUE (text);


--
-- Name: questions questions_text_key99; Type: CONSTRAINT; Schema: public; Owner: tpl622_1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_text_key99 UNIQUE (text);


--
-- PostgreSQL database dump complete
--

