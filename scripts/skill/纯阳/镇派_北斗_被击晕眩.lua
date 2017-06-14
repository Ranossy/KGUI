---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_����_������ѣ.lua
-- ����ʱ��:	2013/8/20 15:12:18
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_����_������ѣ
-- ������    :  ֣����
-- ����ʱ��  :  20110622
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  ��������
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
tSkillData = 
{

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/����_����_������ѣ.lua", -- ����ֵ1
		0															-- ����ֵ2
	);
	----------------- ħ������ -------------------------------------------------
	--skill.BindBuff(1, 2755, dwSkillLevel)

end
--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	local buff1 = target.GetBuff(3070, 1)
	local buff2 = target.GetBuff(3070, 2)
	local player
	if buff1 then
		player = GetPlayer(buff1.dwSkillSrcID)
		target.AddBuff(player.dwID, player.nLevel, 2755, 1, 1)
		target.DelBuff(3070,1)
	end
	if buff2 then
		player = GetPlayer(buff2.dwSkillSrcID)
		target.AddBuff(player.dwID, player.nLevel, 2755, 2, 1)
		target.DelBuff(3070,2)
	end
	--target.AddBuff(player.dwID, player.nLevel, 1229, 1, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com