------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_�ϻ��_�ӵ�.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-06
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  �����﷨
-- ��������  :  �ϻ��_�ӵ�
-- ����Ч��  :  ����ϻ��Dash,����˺��ͻ���,�ӵ������ٶȺ�Dash�ٶ���ͬ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nCostMana = 0, nDamage = 26, nDamageRand = 3},	-- Level 1
     {nCostMana = 0, nDamage = 28, nDamageRand = 3},	-- Level 2
     {nCostMana = 0, nDamage = 33, nDamageRand = 3},	-- Level 3
     {nCostMana = 0, nDamage = 35, nDamageRand = 3},	-- Level 4
     {nCostMana = 0, nDamage = 36, nDamageRand = 3},	-- Level 5
     {nCostMana = 0, nDamage = 38, nDamageRand = 3},	-- Level 6
     {nCostMana = 0, nDamage = 39, nDamageRand = 3},	-- Level 7
};
tPit =                         
{                              
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},

                               
                               
}                              


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	
	skill.BindBuff(1, 2275, 1);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage* (1 - tPit[dwSkillLevel].nReducePercent), 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand* (1 - tPit[dwSkillLevel].nReducePercent), 
		0
	);
    
    skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
    	);

    skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_BUFF,
		540,
		1
    	);

    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);		--����CD1��

	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent		= 1024;
	
	skill.nMinRadius	= 5* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 25 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange	= 256; 										--ʩ�ŽǶ�,ȫ��256
    
	skill.nPrepareFrames	= 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity	= 100;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate	= 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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