---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���Ź�֮��/���Ź�֮��_�ذ���ɳ�ܱ���.lua
-- ����ʱ��:	2014/11/3 16:57:13
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	
end

function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local npc = GetNpc(nCharacterID)
	if npc and npc.bFightState == true then
		npc.PlaySfx(1073, 0, 0, 0)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com