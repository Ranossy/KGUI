---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���Ź�֮��/���Ź�֮��_�������Ź�_Ѫ��.lua
-- ����ʱ��:	2014/9/12 16:04:38
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local npctarget = GetNpc(dwCharacterID)

	if player then
		if player.nCurrentLife == player.nMaxLife then
			player.DelGroupBuff(8243, 1)
		end
	end

	if npctarget then
		if npctarget.nCurrentLife == npctarget.nMaxLife then
			npctarget.DelGroupBuff(8243, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com