---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/Գ������_�������.lua
-- ����ʱ��:	2013/5/31 1:43:50
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_Գ������_�������.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �����¼�
-- ��������  :  �������
-- ����Ч��  :  �������,AOE�˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nLunarDamage = 369 * 0.95, nLunarDamageRand = 369 * 0.1, nCostMana = 110, nAreaRadius = 10},
	{nLunarDamage = 196 * 0.95, nLunarDamageRand = 196 * 0.1, nCostMana = 147, nAreaRadius = 10},
	{nLunarDamage = 230 * 0.95, nLunarDamageRand = 230 * 0.1, nCostMana = 205, nAreaRadius = 10},
	{nLunarDamage = 265 * 0.95, nLunarDamageRand = 265 * 0.1, nCostMana = 246, nAreaRadius = 10},
	{nLunarDamage = 300 * 0.95, nLunarDamageRand = 300 * 0.1, nCostMana = 287, nAreaRadius = 10},
	{nLunarDamage = 334 * 0.95, nLunarDamageRand = 334 * 0.1, nCostMana = 328, nAreaRadius = 10},
	{nLunarDamage = 369 * 0.95, nLunarDamageRand = 369 * 0.1, nCostMana = 369, nAreaRadius = 10}
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

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nLunarDamage/3 * (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nLunarDamageRand/3 * (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/Գ������_�������.lua", --����ֵ1
		0															--����ֵ2
	);
   	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	--����CD1.5��
	skill.SetNormalCoolDown(1, 184);	--����CD25��
	skill.SetCheckCoolDown(1, 444);
	--skill.nDamageToManaForParty = 102
	
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF
		
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 1095;	-- �������ĵ�����
	--------------- ����������� ----------------------------------------------------------------------
   
	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�
	skill.nAreaRadius = tSkillData[dwSkillLevel]. nAreaRadius * LENGTH_BASE;	-- �������ð뾶 
	skill.nTargetCountLimit = 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
	skill.nChannelInterval = 100;
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	if player.GetSkillLevel(5867) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5793, 1, 1)
	end
	if player.GetSkillLevel(6564) == 1 then
		player.CastSkill(3016, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com