------------------------------------------------
-- �ļ���    : ݶ����_С��_��ѨAOE.lua
-- ������    : CBG
-- ����ʱ��  :  2009-11-26
-- ��;(ģ��):  ����С��
-- �书����  :  ݶ����
-- �书����  : 
-- �书��·  :  
-- ��������  :  Dahlia
-- ����Ч��  :  ��������һ�ִ�������ֲ����п龥״�ĸ��͸�����ɫ����������״��ͷ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 130 * 0.8, nDamageRand = 130 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 178 * 0.8, nDamageRand = 178 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 301 * 0.8, nDamageRand = 301 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 432 * 0.8, nDamageRand = 432 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 628 * 0.8, nDamageRand = 628 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 824 * 0.8, nDamageRand = 824 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1134 * 0.8, nDamageRand = 1134 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1352 * 0.8, nDamageRand = 1352 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 1571 * 0.8, nDamageRand = 1571 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 1789 * 0.8, nDamageRand = 1789 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 2007 * 0.8, nDamageRand = 2007 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 2225 * 0.8, nDamageRand = 2225 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 2444 * 0.8, nDamageRand = 2444 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 2662 * 0.8, nDamageRand = 2662 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 2880 * 0.8, nDamageRand = 2880 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 3215 * 0.8, nDamageRand = 3215 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 3288 * 0.8, nDamageRand = 3288 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 3360 * 0.8, nDamageRand = 3360 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 3433 * 0.8, nDamageRand = 3433 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 3506 * 0.8, nDamageRand = 3506 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 3579 * 0.8, nDamageRand = 3579 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 3652 * 0.8, nDamageRand = 3652 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 3724 * 0.8, nDamageRand = 3724 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 3797 * 0.8, nDamageRand = 3797 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 3870 * 0.8, nDamageRand = 3870 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 3943 * 0.8, nDamageRand = 3943 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 4016 * 0.8, nDamageRand = 4016 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 4088 * 0.8, nDamageRand = 4088 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 4161 * 0.8, nDamageRand = 4161 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 4234 * 0.8, nDamageRand = 4234 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 4307 * 0.8, nDamageRand = 4307 * 0.4, nCostMana = 0},		--level 31
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
 	
     skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
        tSkillData[dwSkillLevel].nDamageBase * 0.14, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand * 0.14, 
        0
    );

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
        0, 
        0
    );   

    skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	ATTRIBUTE_TYPE.FREEZE,
	48,
        0
    );
    
    
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab

    --skill.SetPublicCoolDown(16);	--����CD
   --skill.SetNormalCoolDown(2, 126);
	
	
    skill.nWeaponDamagePercent = 0;
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
    ----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

    skill.nAreaRadius        = 15 * LENGTH_BASE;   --����ʩ�ŷ�Χ����
    skill.nAngleRange       = 256;  --ʩ�ŽǶ�
	skill.nTargetCountLimit	= 5;	-- �޶�����Ŀ��Ϊ4��
    
    --����֡��
    skill.nPrepareFrames    = 48;
    
    ----------------- ������ -------------------------------------------------
    skill.nBeatBackRate       = 0;		-- ���ܱ����˵ĸ���,Ĭ��1024
    skill.nBrokenRate         = 0;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
   
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