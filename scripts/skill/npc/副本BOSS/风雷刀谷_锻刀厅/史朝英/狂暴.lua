---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���׵���_�͵���/ʷ��Ӣ/��.lua
-- ����ʱ��:	2017/4/6 19:53:21
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	--local player = GetPlayer(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	local scene = npc.GetScene()
	if npc then
		npc.AddBuff(npc.dwID, npc.nLevel, 11863, 1)
	end

end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com