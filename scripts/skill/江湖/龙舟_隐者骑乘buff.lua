---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_�������buff.lua
-- ����ʱ��:	2017/5/20 19:44:03
-- �����û�:	xutong1-pc
-- �ű�˵��:
----------------------------------------------------------------------<
--Include("scripts/Map/���ն���/include/�������۴�սͷ�ļ�.lua")
--------------�ű��ļ���ʼ------------------------------------------------
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--if not IfBattle(player) then--�����жϱ�������ս���Ƿ��� true:�����С�false���رա�
	--LongZhou_End(player)
	--return
	--end
	player.SetDynamicSkillGroup(338)

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.SetDynamicSkillGroup(0)
	player.DelBuff(11996, 1)
	player.DelGroupBuff(9001,1)
	player.DelGroupBuff(9002, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com