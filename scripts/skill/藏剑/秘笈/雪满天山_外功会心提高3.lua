---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/����/ѩ����ɽ_�⹦�������3.lua
-- ����ʱ��:	2013/4/26 10:38:01
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �Ʒ����_�⹦�������1.lua
-- ������    :  zhanghao
-- ����ʱ��  :  2011-04-01
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  �ؽ�����
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData = 
{
	
};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�ؽ�/����/ѩ����ɽ_�⹦�������3.lua", -- ����ֵ1
		0														-- ����ֵ2
	);

	return
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
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(5959) == 1 then
		if player.GetKungfuMount().dwSkillID == 10145 then
			player.AddBuff(dwCharacterID, player.nLevel, 2701, 3, 1)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com