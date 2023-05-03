void sort_len_and_idx(int *w_len, int *w_addr, long n) {
    for (int i = 1; i < n; i++) {
        int el_len = w_len[i];
        int el_addr = w_addr[i];
        int j = i - 1;
        while (j >= 0 && el_len < w_len[j]) {
            w_len[j + 1] = w_len[j];
            w_addr[j + 1] = w_addr[j];
            j--;
        }
        w_len[j + 1] = el_len;
        w_addr[j + 1] = el_addr;
    }
}
