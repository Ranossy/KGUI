---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/ACT_95�������¼�/��_�ݲ���Ҫ����.lua
-- ����ʱ��:	2015/12/7 15:59:50
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
local BUFFID = 10316
local tBuffList = {
	-- [�ȼ�] = ״̬
	[1] = GetEditorString(9, 1299),
	[2] = GetEditorString(9, 1300),
	[3] = GetEditorString(9, 1301),
	[4] = GetEditorString(9, 1302),
}

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local i = Random(2, #tBuffList)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	npc.AddBuff(0, 99, BUFFID, i)
--	npc.Say(tBuffList[i])
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com