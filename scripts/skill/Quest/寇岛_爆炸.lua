---------------------------------------------------------------------->
-- �ű�����:	G:/zhugan/client/scripts/skill/Quest/�ܵ�_��ը.lua
-- ����ʱ��:	2012-9-14 22:25:10
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �������_�˺�_AOE_10.lua
-- ������    :  zhangqi		
-- ����ʱ��  :  2008-12-31
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  �������_�˺�_AOE_10
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 10000 * 0.8, nDamageRand = 10000 * 0.2, nCostMana = 0}, --level 1
	{nDamageBase = 51 * 0.8, nDamageRand = 51 * 0.4, nCostMana = 0}, --level 2
	{nDamageBase = 73 * 0.8, nDamageRand = 73 * 0.4, nCostMana = 0}, --level 3
	{nDamageBase = 106 * 0.8, nDamageRand = 106 * 0.4, nCostMana = 0}, --level 4
	{nDamageBase = 139 * 0.8, nDamageRand = 139 * 0.4, nCostMana = 0}, --level 5
	{nDamageBase = 191 * 0.8, nDamageRand = 191 * 0.4, nCostMana = 0}, --level 6
	{nDamageBase = 228 * 0.8, nDamageRand = 228 * 0.4, nCostMana = 0}, --level 7
	{nDamageBase = 265 * 0.8, nDamageRand = 265 * 0.4, nCostMana = 0}, --level 8
	{nDamageBase = 302 * 0.8, nDamageRand = 302 * 0.4, nCostMana = 0}, --level 9
	{nDamageBase = 339 * 0.8, nDamageRand = 339 * 0.4, nCostMana = 0}, --level 10
	{nDamageBase = 376 * 0.8, nDamageRand = 376 * 0.4, nCostMana = 0}, --level 11
	{nDamageBase = 412 * 0.8, nDamageRand = 412 * 0.4, nCostMana = 0}, --level 12
	{nDamageBase = 449 * 0.8, nDamageRand = 449 * 0.4, nCostMana = 0}, --level 13
	{nDamageBase = 486 * 0.8, nDamageRand = 486 * 0.4, nCostMana = 0}, --level 14
	{nDamageBase = 523 * 0.8, nDamageRand = 523 * 0.4, nCostMana = 0}, --level 15
	
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;


	----------------- ħ������ -------------------------------------------------

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/Quest/�ܵ�_��ը.lua",
		0
	);

    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetCoolDown(1, 16);						-- ����CD 1.5��
	--skill.SetCoolDown(CoolDownIndex, nCoolDownID);

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 6 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 30				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 32;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
	----------------- ������ -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local target,tnpc
	if IsPlayer(dwCharacterID) then
		 target = GetPlayer(dwCharacterID)
	else
		 tnpc = GetNpc(dwCharacterID)
	end
	if target then
	local damage = target.nMaxLife * 0.2
	if damage > 10000 and target.nCurrentLife > target.nMaxLife * 0.2 then
		target.nCurrentLife = target.nCurrentLife - target.nMaxLife * 0.2
	end
	if damage > 10000 and target.nCurrentLife <= target.nMaxLife * 0.2 then
		target.nCurrentLife = 0
	end
	if damage <= 10000 and target.nCurrentLife > damage then
		target.nCurrentLife = target.nCurrentLife - damage
	end
	if damage <= 10000 and target.nCurrentLife <= damage then
		target.nCurrentLife = 0
	end
	end
	if tnpc then
	local dmg = tnpc.nMaxLife * 0.2
	if dmg > 5000 and tnpc.nCurrentLife > tnpc.nMaxLife * 0.2 then
		tnpc.nCurrentLife = tnpc.nCurrentLife - dmg
	end
	if dmg > 5000 and tnpc.nCurrentLife <= dmg then
		tnpc.nCurrentLife = 0
	end
	if dmg <= 5000 and tnpc.nCurrentLife > 5000 then
		tnpc.nCurrentLife = tnpc.nCurrentLife - 5000
	end
	if dmg <= 5000 and tnpc.nCurrentLife <= 5000 then
		tnpc.nCurrentLife = 0
	end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com