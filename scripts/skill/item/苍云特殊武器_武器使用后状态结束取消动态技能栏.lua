---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/������������_����ʹ�ú�״̬����ȡ����̬������.lua
-- ����ʱ��:	2016/6/7 16:21:16
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	player.DelBuff(11346,1)
	player.DelBuff(11036, 1)--��Ů�ͱ��л���������Ҫ�µ�buffID)
	player.DelBuff(11036, 2)--��̫�����򻻶�������Ҫ�µ�buffID)
	player.DelBuff(8576, 1)--��ǽ�޷��ٴζ�ǽ
	player.DelBuff(10821, 1)--���
	player.DelBuff(11106, 1)--�׵۷�����ʼͼ��Ϊ��
	player.DelBuff(10823, 1)--�������迪ʼͼ��Ϊ��
	player.DelBuff(10824, 1)--���⼼�����ڼ��ܱ���������Ӧbuff
	player.DelBuff(10825, 1)--Ѱ�׻�ɽ��ʼͼ��Ϊ��
	player.DelBuff(11197, 1)--ɾ������buff
	player.SetDynamicSkillGroup(0)
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.PlayCharacterSound(19195)	
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com