* FILE......: equ_fio.asm
* Purpose...: Equates for file I/O operations

***************************************************************
* File IO operations
************************************@**************************
io.op.open       equ >00            ; OPEN
io.op.close      equ >01            ; CLOSE
io.op.read       equ >02            ; READ
io.op.write      equ >03            ; WRITE
io.op.rewind     equ >04            ; RESTORE/REWIND
io.op.load       equ >05            ; LOAD
io.op.save       equ >06            ; SAVE
io.op.delfile    equ >07            ; DELETE FILE
io.op.scratch    equ >08            ; SCRATCH 
io.op.status     equ >09            ; STATUS
***************************************************************
* File types - All relative files are fixed length
************************************@**************************
io.ft.rf.ud      equ >01            ; UPDATE, DISPLAY
io.ft.rf.od      equ >03            ; OUTPUT, DISPLAY
io.ft.rf.id      equ >05            ; INPUT,  DISPLAY
io.ft.rf.ui      equ >09            ; UPDATE, INTERNAL
io.ft.rf.oi      equ >0b            ; OUTPUT, INTERNAL
io.ft.rf.ii      equ >0d            ; INPUT,  INTERNAL
***************************************************************
* File types - Sequential files
************************************@**************************
io.ft.sf.ofd     equ >02            ; OUTPUT, FIXED, DISPLAY
io.ft.sf.ifd     equ >04            ; INPUT,  FIXED, DISPLAY
io.ft.sf.afd     equ >06            ; APPEND, FIXED, DISPLAY
io.ft.sf.ofi     equ >0a            ; OUTPUT, FIXED, INTERNAL
io.ft.sf.ifi     equ >0c            ; INPUT,  FIXED, INTERNAL
io.ft.sf.afi     equ >0e            ; APPEND, FIXED, INTERNAL
io.ft.sf.ovd     equ >12            ; OUTPUT, VARIABLE, DISPLAY
io.ft.sf.ivd     equ >14            ; INPUT,  VARIABLE, DISPLAY
io.ft.sf.avd     equ >16            ; APPEND, VARIABLE, DISPLAY
io.ft.sf.ovi     equ >1a            ; OUTPUT, VARIABLE, INTERNAL
io.ft.sf.ivi     equ >1c            ; INPUT,  VARIABLE, INTERNAL
io.ft.sf.avi     equ >1e            ; APPEND, VARIABLE, INTERNAL

***************************************************************
* File error codes - Bits 13-15 in PAB byte 1
************************************@**************************
io.err.no_error_occured             equ 0
        ; Error code 0 with condition bit reset, indicates that
        ; no error has occured

io.err.bad_device_name              equ 0
        ; Device indicated not in system
        ; Error code 0 with condition bit set, indicates a
        ; device not present in system

io.err.device_write_prottected      equ 1   
        ; Device is write protected

io.err.bad_open_attribute           equ 2   
        ; One or more of the OPEN attributes are illegal or do
        ; not match the file's actual characteristics.
        ; This could be:
        ;   * File type
        ;   * Record length
        ;   * I/O mode
        ;   * File organization

io.err.illegal_operation            equ 3
        ; Either an issued I/O command was not supported, or a 
        ; conflict with the OPEN mode has occured

io.err.out_of_table_buffer_space    equ 4
        ; The amount of space left on the device is insufficient
        ; for the requested operation

io.err.eof                          equ 5
        ; Attempt to read past end of file.
        ; This error may also be given for non-existing records
        ; in a relative record file

io.err.device_error                 equ 6
        ; Covers all hard device errors, such as parity and
        ; bad medium errors

io.err.file_error                   equ 7
        ; Covers all file-related error like: program/data
        ; file mismatch, non-existing file opened for input mode, etc.