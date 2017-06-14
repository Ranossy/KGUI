------------------------------------------------
-- �ļ���    :  ��_�Ṧ_��ذγ�_Ч��.lua
-- ������    :  ����
-- ����ʱ��  :  2008-3-7
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  �⹦
-- �书��·  :  ���Ṧ
-- ��������  :  ��ذγ�
-- ����Ч��  :  ���Լ��ĺ󷽿����ƶ�������ʱ����ɷ�Χ�˺�,����������Ծ�е�Ŀ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
	{nNeutralDamage = 55 ,nNeutralDamageRand = 5},
	{nNeutralDamage = 90 ,nNeutralDamageRand = 10},
	{nNeutralDamage = 125,nNeutralDamageRand = 15},
	{nNeutralDamage = 160,nNeutralDamageRand = 20},
	{nNeutralDamage = 195,nNeutralDamageRand = 20},
	{nNeutralDamage = 230,nNeutralDamageRand = 20}
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    local bRetCode     = false;
    
    skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        	ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, 
        	tSkillData[dwSkillLevel].nNeutralDamage, 
        	0
    );
    
    skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        	ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, 
        	tSkillData[dwSkillLevel].nNeutralDamageRand, 
        	0
    );
	
	skill.AddAttribute(
        	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        	ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, 
        	0, 
        	0
    );
    
--    if dwSkillLevel >= 5 then
--    	skill.BindBuff(1, 998, 1)--ѣ��Ч��
--    end								--2009.6.29ȥ������Ч��
	
    ----------------- ����Cool down ---------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetNormalCoolDown(1, 8);
	
    ----------------- ����������� ----------------------------------------  

    --�����뾶��Ҳ���ǹ�������Ч����
    --skill.nMaxRadius        = 4 * LENGTH_BASE;
    skill.nAngleRange       = 256; 
	skill.nAreaRadius	=	8 * LENGTH_BASE;
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = 0;
    --����ϵĸ���
    skill.nDismountingRate		= PERCENT_BASE;					-- ��Ŀ�����������,����1024��Ĭ��0	2008��6��27��CBG						
  
    skill.nBreakRate        = 0;
   
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com