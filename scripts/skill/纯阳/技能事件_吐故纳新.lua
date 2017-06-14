------------------------------------------------
-- �ļ���    :  �����¼�_�¹�����.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �����¼�
-- ��������  :  �����¼�_�¹�����
-- ����Ч��  :  �¹����µ��¼����ܣ�����ʱ�������Թ������ͷ�һ���˺�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 11 },		--level 1
 	{ nDamageBase = 14 },		--level 2
    { nDamageBase = 17 },		--level 3
    { nDamageBase = 20 },		--level 4
    { nDamageBase = 24 },		--level 5
    { nDamageBase = 25 },		--level 6
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 		--
        ATTRIBUTE_TYPE.MAGIC_ATTACK_POWER_PERCENT,                    --
        -1024,                   
        0                                                   	--
    );
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 		--
        ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,                    --
        tSkillData[dwSkillLevel].nDamageBase,                   
        0                                                   	--
    );
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 		--
        ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,                     --
        0,                   
        0                                                   	--
    );
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= 0;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 10 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 256; 										--ʩ�ŽǶ�
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    --skill.nBreakRate        = 1024;									--��ϵĸ���,Ĭ��1024��ʾһ�����
    
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com