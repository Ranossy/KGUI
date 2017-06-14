---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/ϻ��_���ǳ�Ч��.lua
-- ����ʱ��:	2013/4/22 17:23:25
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  
-- ������    :  CBG
-- ����ʱ��  :  2011-04-03
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
	local dwSkillLevel = skill.dwLevel;

	if nRecipeLevel == 1 then
		skill.BindBuff(2, 2929, dwSkillLevel)			-- ����Buff
	elseif nRecipeLevel == 2 then
		--skill.BindBuff(2, 2930, dwSkillLevel)			-- ����Buff
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
			"skill/����/����/ϻ��_���ǳ�Ч��.lua", -- ����ֵ1
			0														-- ����ֵ2
		);
	end
	return true;
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
	local player = GetPlayer(dwCharacterID)
	if dwCharacterID == dwSkillSrcID then
		player.AddBuff(dwCharacterID, player.nLevel, 2930, 7, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com