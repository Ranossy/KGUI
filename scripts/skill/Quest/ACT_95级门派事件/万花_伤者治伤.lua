---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/ACT_95�������¼�/��_��������.lua
-- ����ʱ��:	2015/12/10 19:58:45
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
local BUFFID = 10335
local tBuffList = {
	-- [�ȼ�] = ״̬
	[1] = GetEditorString(9, 1981),
	[2] = GetEditorString(9, 1986),
	[3] = GetEditorString(9, 1987),
	[4] = GetEditorString(9, 1988),
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