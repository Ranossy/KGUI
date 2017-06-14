---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/Գ������_��������.lua
-- ����ʱ��:	2013/5/1 12:13:13
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  kingbeyond	
-- ����ʱ��  :  2009-3-13
-- ����Ч��  :  ���������˺���10%�˺������ѻ���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nLunarDamage = 33*2*0.98, nLunarDamageRand = 33*2*0.04,  nCostMana = 30 },
	{nLunarDamage = 41*2*0.98, nLunarDamageRand = 41*2*0.04,  nCostMana = 50 },
	{nLunarDamage = 50*2*0.98, nLunarDamageRand = 50*2*0.04,  nCostMana = 67 },
	{nLunarDamage = 58*2*0.98, nLunarDamageRand = 58*2*0.04,  nCostMana = 93 },
	{nLunarDamage = 67*2*0.98, nLunarDamageRand = 67*2*0.04,   nCostMana = 111},
	{nLunarDamage = 75*2*0.98, nLunarDamageRand = 75*2*0.04,   nCostMana = 130},
	{nLunarDamage = 84*2*0.98, nLunarDamageRand = 84*2*0.04,   nCostMana = 149},
	{nLunarDamage = 92*2*0.98, nLunarDamageRand = 92*2*0.04,   nCostMana = 167},
	{nLunarDamage = 101*2*0.98, nLunarDamageRand = 101*2*0.04,   nCostMana = 186},
	{nLunarDamage = 109*2*0.98, nLunarDamageRand = 109*2*0.04,   nCostMana = 186},
	{nLunarDamage = 118*2*0.98, nLunarDamageRand = 118*2*0.04,   nCostMana = 30 },
	{nLunarDamage = 126*2*0.98, nLunarDamageRand = 126*2*0.04,   nCostMana = 50 },
	{nLunarDamage = 135*2*0.98, nLunarDamageRand = 135*2*0.04,   nCostMana = 67 },
	{nLunarDamage = 143*2*0.98, nLunarDamageRand = 143*2*0.04,   nCostMana = 93 },
	{nLunarDamage = 152*2*0.98, nLunarDamageRand = 152*2*0.04,   nCostMana = 111},
	{nLunarDamage = 160*2*0.98, nLunarDamageRand = 160*2*0.04,   nCostMana = 130},
	{nLunarDamage = 169*2*0.98, nLunarDamageRand = 169*2*0.04,   nCostMana = 149},
	{nLunarDamage = 177*2*0.98, nLunarDamageRand = 177*2*0.04,   nCostMana = 167},
	{nLunarDamage = 186*2*0.98, nLunarDamageRand = 186*2*0.04,   nCostMana = 186},
	{nLunarDamage = 194*2*0.98, nLunarDamageRand = 194*2*0.04,   nCostMana = 186},
	{nLunarDamage = 203*2*0.98, nLunarDamageRand = 203*2*0.04,   nCostMana = 30 },
	{nLunarDamage = 211*2*0.98, nLunarDamageRand = 211*2*0.04,   nCostMana = 50 },
	{nLunarDamage = 220*2*0.98, nLunarDamageRand = 220*2*0.04,   nCostMana = 67 },
	{nLunarDamage = 228*2*0.98, nLunarDamageRand = 228*2*0.04,   nCostMana = 93 },
	{nLunarDamage = 237*2*0.98, nLunarDamageRand = 237*2*0.04,   nCostMana = 111},
	{nLunarDamage = 245*2*0.98, nLunarDamageRand = 245*2*0.04,   nCostMana = 130},
	{nLunarDamage = 254*2*0.98, nLunarDamageRand = 254*2*0.04,   nCostMana = 149},
	{nLunarDamage = 262*2*0.98, nLunarDamageRand = 262*2*0.04,   nCostMana = 167},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nLunarDamage*0.25,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nLunarDamageRand*0.25,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);
   	
	----------------- ����CoolDown ---------------------------------------------------------------------
	skill.AddSlowCheckDestOwnBuff(7991, 4, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- ����Ŀ�������Լ���Buff
	--skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	--skill.AddSlowCheckSelfBuff(5866, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--����CD
	--skill.SetNormalCoolDown(1, 123);	--����CD10��
	--skill.SetCheckCoolDown(1, 444);	
	--skill.nDamageToManaForParty = 51;	-- �˺���5%תΪ�������
	
	--skill.AddSlowCheckSelfBuff(409, 3, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF
		
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 472;	-- �������ĵ�����
	--------------- ����������� ----------------------------------------------------------------------
   
	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 25 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 128; 									--ʩ�ŽǶ�
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64*1.1*1.2*1.1*0.2;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (64 + (dwSkillLevel - 9) * 4)*1.1*1.2*1.1*0.2
	else
		skill.nChannelInterval =152*1.1*1.2*1.1*0.2;     -- ͨ�������ʱ��   
	end
	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com