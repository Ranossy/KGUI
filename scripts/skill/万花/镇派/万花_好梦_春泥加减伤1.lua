------------------------------------------------
-- �ļ���    :  ��_����_����Ӽ���1.lua
-- ������    :  zhanghao
-- ����ʱ��  :  2011-04-05
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
	{ nTherapyBase = 417, 	nTherapyRand = 40, 	nCostMana = 104 * 1.2},
};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
    
  	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
  		ATTRIBUTE_TYPE.SKILL_THERAPY,									-- ħ������
  		tSkillRecipeData[nRecipeLevel].nTherapyBase,							--����ֵ1
  		0																--����ֵ2
 		);
   	
   	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
  		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,								-- ħ������
  		tSkillRecipeData[nRecipeLevel].nTherapyRand ,							--����ֵ1
  		0																--����ֵ2
 		);
   	
   	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- ��������ģʽ
  		ATTRIBUTE_TYPE.CALL_THERAPY,									-- ħ������
  		0,																--����ֵ1
  		0																--����ֵ2
 		);
     skill.nChannelInterval	= skill.nChannelInterval + 32; 
		skill.SetBuffRecipe(1,49, 1);
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