------------------------------------------------
-- �ļ���    :  ��_�д�Ӱ_����ع������1.lua
-- ������    :  zhanghao
-- ����ʱ��  :  2011-04-04
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  ������
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

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
    
	skill.AddAttribute(
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						-- ��������ģʽ
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								-- ħ������
 		286,												--����ֵ1
 		1										--����ֵ2
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com