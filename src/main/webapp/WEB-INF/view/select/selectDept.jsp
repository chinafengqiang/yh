<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@include file="/commons/include.jsp"%>

<div class="modal-header">
    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
    <h4 class="modal-title">选择年级</h4>
</div>
<div class="modal-body">

    <div class="row">

        <div class="col-md-4" style="height: 500px;">
            选择学校
            <jsp:include page="orgTree.jsp">
                <jsp:param name="org_tree_config" value="dept_tree"></jsp:param>
            </jsp:include>
        </div>
        <div class="col-md-4" style="height: 500px;">
            年级(双击可选中)
            <select size="20" style="width: 100%;height: 90%;font-size: 14px;overflow: auto;" id="sourceList_dept" ondblclick="addSelect();">
            </select>

        </div>
        <div class="col-md-1" style="height: 500px;text-align: center;">
            <div style="text-align: center;width: 100%;margin-top: 220px;cursor: pointer;">
                <img src="${staticPath}/images/rightbtn2.gif" onclick="addSelect();">
            </div>
            <div style="text-align: center;width: 100%;margin-top: 30px;cursor: pointer;">
                <img src="${staticPath}/images/leftbtn2.gif" onclick="delDestList();">
            </div>
        </div>
        <div class="col-md-3" style="height: 500px;">
            已选择年级(双击删除)
            <select size="20" style="width: 100%;height: 90%;font-size: 14px;overflow: auto;" id="destList_dept" ondblclick="delDestList();">
            </select>
        </div>
    </div>

    <div style="text-align: center;">
        <button type="button" class="btn btn-success" onclick="submitSelect();">确定</button>
        <button data-dismiss="modal" class="btn btn-cancel" type="button">取消</button>
    </div>
</div>
<script type="text/javascript" src="${staticPath}/js/selectobject.js"></script>
<script type="text/javascript">

    function setSelectDeptSource(result) {
        if(result != null){
            var sourceList = document.getElementById("sourceList_dept");
            sourceList.length = 0;
            for(var i=0;i < result.length;i++){
                var id = result[i].iacMap.ID;
                var name = result[i].iacMap.NAME;
                addElement(sourceList,id, name);
            }
        }
    }

    function addSelect(){
        var sourceList = document.getElementById("sourceList_dept");
        if (sourceList != null && sourceList.selectedIndex >= 0) {
            var op = sourceList.options[sourceList.selectedIndex];
            var destList = document.getElementById("destList_dept");
            addElement(destList, op.value, op.text);
        }else
        {
            Alert("没有选中年级！");
        }
    }


    function delDestList(){
        var destList = document.getElementById("destList_dept");
        if(destList.selectedIndex>=0){
            destList.remove(destList.selectedIndex);
        }
    }

    function submitSelect() {
        var destList = document.getElementById("destList_dept");
        if(destList.length < 1){
            Alert("请选择年级！");
            return false;
        }

        var recObjList = document.getElementById("REC_OBJ");
        for(var i=0;i<destList.length;i++) {
            var op=destList.options[i];
            addElement(recObjList, op.value, op.text);
        }

        hideSelectModal();
    }

    function setSource() {
    }
</script>