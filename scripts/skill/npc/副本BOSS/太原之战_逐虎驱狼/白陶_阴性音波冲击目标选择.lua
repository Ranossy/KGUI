---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/����_�����������Ŀ��ѡ��.lua
-- ����ʱ��:	2014/7/29 16:12:50
-- �����û�:	ZHOUMING
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Map/̫ԭ֮ս_������/include/�����������ѡ��Ŀ��.lua")
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/npc/����BOSS/̫ԭ֮ս_������/����_�����������Ŀ��ѡ��.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(8023, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(8023, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff
	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

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
	--skill.BindBuff(1, 7993, dwSkillLevel);		-- ����1��λBuff
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
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 20 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 6 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit = 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 36;				-- ����֡��
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
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSrcID)
	local npc = GetNpc(dwSrcID)
	if not npc then
		Log(GetEditorString(6, 6259))
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return
	end
		local tLevel = {
		[192] = 1,
		[199] = 2,
		[206] = 3,		
		[212] = 4,
	}
	local nlevel = tLevel[scene.dwMapID]
	local tTargetList = GetYBChJTargetList(npc)--��������ͷ����������Ŀ���б�
	if tTargetList and #tTargetList > 0 then
		for i = 1, #tTargetList do
			if i == 1 then--��һ��Ŀ�����⴦��
				local playerThis = GetPlayer(tTargetList[i])
				local ii
				if nlevel == 1 then
					ii = i
				elseif nlevel == 2 then
					ii = 11
				elseif nlevel == 3 then
					ii = 36
				elseif nlevel == 4 then
					ii = 61
				end
				if playerThis then
					playerThis.AddBuff(npc.dwID, 99, 8174, nlevel)
				end
				npc.CastSkill(9547, ii, TARGET.PLAYER, tTargetList[i])--�˺�����
				npc.CastSkill(9548, nlevel, TARGET.PLAYER, tTargetList[i])--��״����
				--npc.AddBuff(npc.dwID, 99, 8030, 1, 1, 6)--boss�ҳ����ż��ܵ�buff
			else
				local ii
				if nlevel == 1 then
					ii = i
				elseif nlevel == 2 then
					ii = i + 10
				elseif nlevel == 3 then 
					ii = i + 35
				elseif nlevel == 4 then
					ii = i + 60
				end
				npc.CastSkill(9547, ii, TARGET.PLAYER, tTargetList[i])--�˺�����
				local playerThis = GetPlayer(tTargetList[i])
				if playerThis then
					playerThis.AddBuff(npc.dwID, 99, 8174, nlevel)
					if i == #tTargetList then--���һ�����⴦��
						local buff8174 = playerThis.GetBuff(8174, nlevel)
						if buff8174 then
							buff8174.nCustomValue = tTargetList[1]
						end
						--playerThis.SetTimer(4, "scripts/Map/̫ԭ֮ս_������/include/�����������ѡ��Ŀ��.lua", tTargetList[1], 0)
					end
				end
				local playerLast = GetPlayer(tTargetList[i-1])
				if playerLast then
					local buff8027 = playerLast.GetBuff(8174, nlevel)
					if buff8027 then
						buff8027.nCustomValue = tTargetList[i]
					end
					playerLast.CastSkill(9548, nlevel, TARGET.PLAYER, tTargetList[i])--��״����
				end
				playerLast = nil
			end
		end
	end
	--local tPlayerList = scene.GetAllPlayer()
	--if not tPlayerList or #tPlayerList == 0 then
	--return
	--end
	--local dwTargetID = 0
	--local tPlayerListNear = {}--���ڴ洢��boss����8���ڵ�����б�
	--local tPlayerListFar = {}--���ڴ�����boss������8����������
	--for i = 1, #tPlayerList do
	--local playerThis = GetPlayer(tPlayerList[i])
	--if playerThis.nMoveState == MOVE_STATE.ON_DEATH then
	--print("���"..player.szName.."��������״̬��δ���������Ŀ���б�")
	--elseif player.GetBuff(8027, 1) then
	--print("���"..player.szName.."��������״̬��δ���������Ŀ���б�")
	--else
	--local nDis = math.sqrt(GetDistanceSq(npc.nX, npc.nY, 0, playerThis.nX, playerThis.nY, 0))
	--if nDis <= 8 * 64 then
	--print("���"..player.szName.."��boss�ľ���С��8�ߣ�������boss�Ͻ����б�")
	--table.insert(tPlayerListNear, #tPlayerListNear + 1, {tPlayerList[i]})
	--else
	--print("���"..player.szName.."��boss�ľ������8�ߣ�������boss��Զ���б�")
	--table.insert(tPlayerListFar, #tPlayerListFar + 1, {tPlayerList[i]})
	--end
	--end
	--end
	--if (#tPlayerListFar > 0) then
	--print("����boss��Զ����ң����һ��Ϊ��һĿ�꣡")
	--dwTargetID = tPlayerListFar[Random(1, #tPlayerListFar)]
	--elseif (#tPlayerListNear) > 0 then
	--print("����boss�Ͻ�����ң����һ��Ϊ��һĿ�꣡")
	--dwTargetID = tPlayerListNear[Random(1,#tPlayerListNear)]
	--end
	--if dwTargetID ~= 0 then
	--npc.CastSkill(9394, 1, TARGET.PLAYER, dwTargetID)--�˺�����
	--npc.CastSkill(9395, 1, TARGET.PLAYER, dwTargetID)--��״����
	--npc.AddBuff(npc.dwID, 99, 8030, 1, 1, 6)--boss�ҳ����ż��ܵ�buff
	--end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com