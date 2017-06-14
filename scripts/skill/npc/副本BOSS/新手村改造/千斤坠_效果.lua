------------------------------------------------
-- �ļ���    :  ǧ��׹_�ͷ�.lua
-- ������    :  ����
-- ����ʱ��  :  2008-1-29
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��������
-- ��������  :  ǧ��׺_�ͷ�
-- ����Ч��  :  �ͷ�ǧ��׺BUFF
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
	{nSolarDamage = 55 ,nSolarDamageRand=3},
	{nSolarDamage = 90 ,nSolarDamageRand=3},
	{nSolarDamage = 125,nSolarDamageRand=3},
	{nSolarDamage = 160,nSolarDamageRand=3},
	{nSolarDamage = 195,nSolarDamageRand=3},
	{nSolarDamage = 230,nSolarDamageRand=3}
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    local bRetCode     = false;
	if dwSkillLevel >= 5 then
		skill.BindBuff(1,464,1)--ѣ��Ч��
	end
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
        tSkillData[dwSkillLevel].nSolarDamage, 
        0
    );
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nSolarDamageRand, 
        0
    );
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
        0, 
        0
    );
    
    --skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
    
    ----------------- ����Cool down ---------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetNormalCoolDown(1, 8);
	
    ----------------- ����������� ----------------------------------------  
    

    --�����뾶��Ҳ���ǹ�������Ч����		
    skill.nAreaRadius        = 8 * LENGTH_BASE;
    skill.nAngleRange       = 256; 
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = 0;
    --����ϵĸ���
    skill.nDismountingRate  = 1024;									--������Ϊ100%
    skill.nBreakRate        = 1000;
   
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