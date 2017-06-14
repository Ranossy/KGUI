---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/��������-ս������/�������.lua
-- ����ʱ��:	2015/6/4 10:30:45
-- �����û�:	xutong3
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ����
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 3, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- ��������ģʽ
   		ATTRIBUTE_TYPE.nAttributeKey,								-- ħ������
   		nAttributeValue1,											-- ����ֵ1
   		nAttributeValue2											-- ����ֵ2
   		);
    --]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/npc/��������-ս������/�������.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
    	
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

	-----------------����ʩ����̬����(����)----------------------------------------
	--skill.nNeedPoseState = 1    --�����̬��1Ϊ�浶��̬��2Ϊ�����̬

	----------------�����˺���С�ӻ�Ѫ------------------------------------------

	--skill.nDamageToLifeForParty = 0	--�����˺���С�ӳ�Ա�ٷֱȻ�Ѫ

	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 8757, 1)			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.nNeedAccumulateCount = 0;				-- ������Ҫ����ĸ�������skill.bIsAccumulate	= trueʱ��Ч
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end
local dwTemplateID = 43294
--local tLive = {
--[44788] = 44789, --�� ��
--[44789] = 44791, --�� ��
--[44791] = 44715, --�� ˮ
--[44715] = 44790, --ˮ ľ
--[44790] = 44788, --ľ ��
--}
--local tDie = {
--[44788] = 44791, --�� ��
--[44789] = 44715, --�� ˮ
--[44791] = 44790, --�� ľ
--[44715] = 44788, --ˮ ��
--[44790] = 44789, --ľ ��
--}
local Ele_Gold = 1
local Ele_Wood = 2
local Ele_Water = 3
local Ele_Fire = 4
local Ele_Earth = 5

local tElementLive = {--����ʲô��
	[Ele_Gold] = Ele_Earth,
	[Ele_Wood] = Ele_Water,
	[Ele_Water] = Ele_Gold,
	[Ele_Fire] = Ele_Wood,
	[Ele_Earth] = Ele_Fire,
}
local tElementDie = {--�������˭
	[Ele_Gold] = Ele_Wood,
	[Ele_Wood] = Ele_Earth,
	[Ele_Water] = Ele_Fire,
	[Ele_Fire] = Ele_Gold,
	[Ele_Earth] = Ele_Water,
}
--local tEle = {--Element:1��2ľ��3ˮ
--[44821] = {Element = Ele_Gold,Level = 1,Die = tElementDie[Ele_Gold],Live = tElementLive[Ele_Gold]},--С��
--[44822] = {Element = Ele_Wood,Level = 1,Die = tElementDie[Ele_Wood],Live = tElementLive[Ele_Wood]},--Сľ
--[44823] = {Element = Ele_Water,Level = 1,Die = tElementDie[Ele_Water],Live = tElementLive[Ele_Water]},--Сˮ
--[44824] = {Element = Ele_Fire,Level = 1,Die = tElementDie[Ele_Fire],Live = tElementLive[Ele_Fire]},--С��
--[44825] = {Element = Ele_Earth,Level = 1,Die = tElementDie[Ele_Earth],Live = tElementLive[Ele_Earth]}, --С��
--[44788] = {Element = Ele_Fire,Level = 2,Die = tElementDie[Ele_Fire],Live = tElementLive[Ele_Fire] }, --�� 
--[44789] = {Element = Ele_Earth,Level = 2,Die = tElementDie[Ele_Earth],Live = tElementLive[Ele_Earth]},--�� 
--[44791] = {Element = Ele_Gold,Level = 2,Die = tElementDie[Ele_Gold],Live = tElementLive[Ele_Gold]},--�� 
--[44893] = {Element = Ele_Water,Level = 2,Die = tElementDie[Ele_Water],Live = tElementLive[Ele_Water]},--ˮ 
--[44790] = {Element = Ele_Wood, Level = 2, Die = tElementDie[Ele_Wood], Live = tElementLive[Ele_Wood]}, --ľ
--}
local tEle = {--Element:1��2ľ��3ˮ
	[44821] = {Element = Ele_Gold,Level = 1},--С��
	[44822] = {Element = Ele_Wood,Level = 1},--Сľ
	[44823] = {Element = Ele_Water,Level = 1},--Сˮ
	[44824] = {Element = Ele_Fire,Level = 1},--С��
	[44825] = {Element = Ele_Earth,Level = 1}, --С��
	[44788] = {Element = Ele_Fire,Level = 2}, --�� 
	[44789] = {Element = Ele_Earth,Level = 2},--�� 
	[44791] = {Element = Ele_Gold,Level = 2},--�� 
	[44893] = {Element = Ele_Water,Level = 2},--ˮ 
	[44790] = {Element = Ele_Wood, Level = 2}, --ľ
	
	[44890] = {Element = Ele_Gold,Level = 3},--���
	[44889] = {Element = Ele_Wood,Level = 3},--��ľ
	[44888] = {Element = Ele_Water,Level = 3},--��ˮ
	[44887] = {Element = Ele_Fire,Level = 3},--���
	[44886] = {Element = Ele_Earth,Level = 3}, --����

}
for i, v in pairs(tEle) do--�Զ�д�������ı���ID
	v.Die = tElementDie[v.Element]
	v.Live = tElementLive[v.Element]
	--print(i)
	--print(v.Element)
	--print(v.Die)
	--print(v.Live)
end
for i, v1 in pairs(tEle) do--�Զ�д�������ı���ID
	for j, v2 in pairs(tEle) do
		if v1.Element == v2.Element and v1.Level + 1 == v2.Level then
			v1.UpGrade = j
		end
	end
end

--for i, v1 in pairs(tEle) do
--print(v1.UpGrade)
--end
--local tSmall = {
--[44821] = {Die = {44822},Live = {44823},Upgrade = 44791,},--С��
--[44822] = {Die ={44825},Live = {44824},Upgrade = 44790,},--Сľ
--[44823] = {Die ={44824},Live = {44822},Upgrade = 44715,},--Сˮ
--[44824] = {Die ={44822},Live = {44825},Upgrade = 44788,},--С��
--[44825] = {Die = {44823}, Live = {44821}, Upgrade = 44789, }, --С��
--[44788] = {Live = {44789,}, Die = {44791},Destroy = }, --�� 
--[44789] = {Live = {44791,}, Die = {44715},},--�� 
--[44791] = {Live = {44715,}, Die = {44790},},--�� 
--[44715] = {Live = {44790,}, Die = {44788},},--ˮ 
--[44790] = {Live = {44788,}, Die = {44789},}, --ľ 
--}
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
local dwSFXID = 718
function Apply(dwCharacterID, dwSourceID)
	--if dwCharacterID ~= dwTemplateID or dwSourceID ~= dwTemplateID then
	--print(dwCharacterID)
	--print(dwSourceID)
	--print(2)
	--return
	--end

	local target = GetNpc(dwCharacterID)--Ŀ��
	local self = GetNpc(dwSourceID)
	if not target or not self then
		return
	end
	if target.dwTemplateID ~= self.dwTemplateID then
		return
	end
	local tEleSlef = tEle[self.dwModelID]
	local tEleTarget = tEle[target.dwModelID]
	if tEleSlef.Live == tEleTarget.Element then--����
		if tEleSlef.UpGrade then
			target.PlaySfx(dwSFXID, target.nX, target.nY, target.nZ)
			target.Die()
			self.PlaySfx(dwSFXID, self.nX, self.nY, self.nZ)
			self.SetModelID(tEleSlef.UpGrade)
			self.AddBuff(1, 1, 9015, 1, 30)
		end
		if tEleTarget.Level - tEleSlef.Level > 0 then--����еȼ��������������
			for i = 1, tEleTarget.Level - tEleSlef.Level do
				tEleSlef = tEle[self.dwModelID]
				if tEleSlef.UpGrade then
					self.SetModelID(tEleSlef.UpGrade)
				end	
			end
		end
	end
	if tEleSlef.Die == tEleTarget.Element then--���

		if tEleSlef.Level > tEleTarget.Level then
			target.PlaySfx(dwSFXID, target.nX, target.nY, target.nZ)
			target.Die()
		elseif tEleSlef.Level < tEleTarget.Level then
			self.PlaySfx(dwSFXID, self.nX, self.nY, self.nZ)
			self.Die()
		else
			target.PlaySfx(dwSFXID, target.nX, target.nY, target.nZ)
			target.Die()
			self.PlaySfx(dwSFXID, self.nX, self.nY, self.nZ)
			self.Die()
			
		end
	end
	--	print(self.dwModelID)
	--	print(target.dwModelID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com